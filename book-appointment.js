const appointmentForm = document.getElementById("appointmentForm");
const formAlert = document.getElementById("formAlert");
const confirmationCard = document.getElementById("confirmationCard");
const confirmationMessage = document.getElementById("confirmationMessage");
const bookAnotherBtn = document.getElementById("bookAnotherBtn");
const submitButton = appointmentForm.querySelector('button[type="submit"]');
const appointmentDateInput = document.getElementById("appointmentDate");
const dobInput = document.getElementById("dob");

const storageKey = "bookAppointments";

function getTodayISODate() {
  const now = new Date();
  const month = `${now.getMonth() + 1}`.padStart(2, "0");
  const day = `${now.getDate()}`.padStart(2, "0");
  return `${now.getFullYear()}-${month}-${day}`;
}

function setDateLimits() {
  const today = getTodayISODate();
  appointmentDateInput.min = today;
  dobInput.max = today;
}

function clearAlert() {
  formAlert.className = "form-alert";
  formAlert.textContent = "";
}

function setAlert(message, type) {
  formAlert.className = `form-alert is-${type}`;
  formAlert.textContent = message;
}

function clearFieldError(fieldContainer) {
  fieldContainer.classList.remove("has-error");
  const errorNode = fieldContainer.querySelector(".error-text");
  if (errorNode) {
    errorNode.textContent = "";
  }
}

function showFieldError(fieldContainer, message) {
  fieldContainer.classList.add("has-error");
  const errorNode = fieldContainer.querySelector(".error-text");
  if (errorNode) {
    errorNode.textContent = message;
  }
}

function validateEmail(value) {
  return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value);
}

function validatePhone(value) {
  return /^[0-9+\-\s()]{7,20}$/.test(value);
}

function getAgeYears(dobValue) {
  const dob = new Date(dobValue);
  const now = new Date();
  let age = now.getFullYear() - dob.getFullYear();
  const monthDifference = now.getMonth() - dob.getMonth();
  if (
    monthDifference < 0 ||
    (monthDifference === 0 && now.getDate() < dob.getDate())
  ) {
    age -= 1;
  }
  return age;
}

function validateForm() {
  let hasError = false;
  clearAlert();

  appointmentForm.querySelectorAll(".field").forEach(clearFieldError);

  const consentRow = appointmentForm.querySelector(".consent-row");
  consentRow.classList.remove("has-error");
  consentRow.querySelector(".error-text").textContent = "";

  appointmentForm.querySelectorAll("input, select, textarea").forEach((el) => {
    const fieldWrapper = el.closest(".field");
    const value = el.type === "checkbox" ? el.checked : el.value.trim();

    if (el.required && !value) {
      hasError = true;
      if (fieldWrapper) {
        showFieldError(fieldWrapper, "This field is required.");
      }
    }
  });

  const fullName = appointmentForm.fullName.value.trim();
  if (fullName && fullName.length < 3) {
    hasError = true;
    showFieldError(
      appointmentForm.fullName.closest(".field"),
      "Please enter at least 3 characters."
    );
  }

  const email = appointmentForm.emailAddress.value.trim();
  if (email && !validateEmail(email)) {
    hasError = true;
    showFieldError(
      appointmentForm.emailAddress.closest(".field"),
      "Please enter a valid email address."
    );
  }

  const phone = appointmentForm.phoneNumber.value.trim();
  if (phone && !validatePhone(phone)) {
    hasError = true;
    showFieldError(
      appointmentForm.phoneNumber.closest(".field"),
      "Use a valid phone format."
    );
  }

  const emergencyContact = appointmentForm.emergencyContact.value.trim();
  if (emergencyContact && emergencyContact.length < 5) {
    hasError = true;
    showFieldError(
      appointmentForm.emergencyContact.closest(".field"),
      "Please enter contact name and number."
    );
  }

  const dob = appointmentForm.dob.value;
  if (dob) {
    const age = getAgeYears(dob);
    if (age < 0 || age > 120) {
      hasError = true;
      showFieldError(appointmentForm.dob.closest(".field"), "Enter a valid date of birth.");
    }
  }

  const appointmentDate = appointmentForm.appointmentDate.value;
  if (appointmentDate && appointmentDate < getTodayISODate()) {
    hasError = true;
    showFieldError(
      appointmentForm.appointmentDate.closest(".field"),
      "Appointment date cannot be in the past."
    );
  }

  if (!appointmentForm.consent.checked) {
    hasError = true;
    consentRow.classList.add("has-error");
    consentRow.querySelector(".error-text").textContent =
      "You must agree before submitting.";
  }

  if (hasError) {
    setAlert("Please fix highlighted fields and submit again.", "error");
    return false;
  }

  return true;
}

function getFormData() {
  return {
    requestId: `APT-${Date.now()}`,
    submittedAt: new Date().toISOString(),
    fullName: appointmentForm.fullName.value.trim(),
    emailAddress: appointmentForm.emailAddress.value.trim(),
    phoneNumber: appointmentForm.phoneNumber.value.trim(),
    dob: appointmentForm.dob.value,
    department: appointmentForm.department.value,
    doctor: appointmentForm.doctor.value,
    appointmentDate: appointmentForm.appointmentDate.value,
    appointmentTime: appointmentForm.appointmentTime.value,
    visitType: appointmentForm.visitType.value,
    insurance: appointmentForm.insurance.value.trim(),
    emergencyContact: appointmentForm.emergencyContact.value.trim(),
    reason: appointmentForm.reason.value,
    notes: appointmentForm.notes.value.trim(),
  };
}

function saveAppointment(payload) {
  const existing = JSON.parse(localStorage.getItem(storageKey) || "[]");
  existing.unshift(payload);
  localStorage.setItem(storageKey, JSON.stringify(existing));
}

function showConfirmation(payload) {
  confirmationMessage.textContent = `${payload.fullName}, your request (${payload.requestId}) for ${payload.appointmentDate} at ${payload.appointmentTime} with ${payload.doctor} has been submitted.`;
  confirmationCard.hidden = false;
}

function resetForNextBooking() {
  appointmentForm.reset();
  clearAlert();
  appointmentForm.querySelectorAll(".field").forEach(clearFieldError);
  appointmentForm.querySelector(".consent-row").classList.remove("has-error");
  appointmentForm.querySelector(".consent-row .error-text").textContent = "";
  confirmationCard.hidden = true;
  setDateLimits();
}

appointmentForm.addEventListener("input", (event) => {
  if (event.target.matches("input, select, textarea")) {
    const fieldWrapper = event.target.closest(".field");
    if (fieldWrapper) {
      clearFieldError(fieldWrapper);
    }
    if (event.target.id === "consent") {
      const consentRow = appointmentForm.querySelector(".consent-row");
      consentRow.classList.remove("has-error");
      consentRow.querySelector(".error-text").textContent = "";
    }
  }
});

appointmentForm.addEventListener("submit", (event) => {
  event.preventDefault();
  if (!validateForm()) {
    return;
  }

  submitButton.disabled = true;
  submitButton.textContent = "Submitting...";

  const payload = getFormData();

  window.setTimeout(() => {
    saveAppointment(payload);
    setAlert("Appointment request submitted successfully.", "success");
    showConfirmation(payload);
    submitButton.disabled = false;
    submitButton.textContent = "Confirm Appointment";
  }, 450);
});

bookAnotherBtn.addEventListener("click", resetForNextBooking);

setDateLimits();
