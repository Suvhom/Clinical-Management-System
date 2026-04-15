function toggleRole(role) {
    const patientBtn = document.getElementById('patient-btn');
    const adminBtn = document.getElementById('admin-btn');
    const bannerTitle = document.getElementById('banner-title');
    const bannerDesc = document.getElementById('banner-description');
    const formSubtitle = document.getElementById('form-subtitle');

    if (role === 'patient') {
        // Update Buttons
        patientBtn.classList.add('active');
        adminBtn.classList.remove('active');

        // Update Text for Patient
        bannerTitle.innerText = "Care tailored to your movement.";
        bannerDesc.innerText = "Sign in to track your exercises, view therapy progress, and communicate with your clinical specialists.";
        formSubtitle.innerText = "Sign in to your MotionRehab patient portal";
    } else {
        // Update Buttons
        adminBtn.classList.add('active');
        patientBtn.classList.remove('active');

        // Update Text for Admin
        bannerTitle.innerText = "Manage care, support every patient.";
        bannerDesc.innerText = "Sign in as admin to manage patient records, schedule workflows, and oversee the MotionRehab portal securely.";
        formSubtitle.innerText = "Sign in to your MotionRehab admin account";
    }
}

// Handle Form Submission
document.getElementById('loginForm').addEventListener('submit', function(e) {
    e.preventDefault();
    
    // Simple validation feedback
    const email = this.querySelector('input[type="email"]').value;
    const password = this.querySelector('input[type="password"]').value;
    
    console.log("Logging in with:", { email, password });
    alert("Login system connected! Checking credentials...");
});