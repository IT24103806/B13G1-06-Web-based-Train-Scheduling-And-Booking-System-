<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Train Booking System</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        border: "hsl(214.3 31.8% 91.4%)",
                        input: "hsl(214.3 31.8% 91.4%)",
                        ring: "hsl(222.2 84% 4.9%)",
                        background: "hsl(0 0% 100%)",
                        foreground: "hsl(222.2 84% 4.9%)",
                        primary: {
                            DEFAULT: "hsl(222.2 47.4% 11.2%)",
                            foreground: "hsl(210 40% 98%)",
                        },
                        secondary: {
                            DEFAULT: "hsl(210 40% 96%)",
                            foreground: "hsl(222.2 84% 4.9%)",
                        },
                        destructive: {
                            DEFAULT: "hsl(0 84.2% 60.2%)",
                            foreground: "hsl(210 40% 98%)",
                        },
                        muted: {
                            DEFAULT: "hsl(210 40% 96%)",
                            foreground: "hsl(215.4 16.3% 46.9%)",
                        },
                        accent: {
                            DEFAULT: "hsl(210 40% 96%)",
                            foreground: "hsl(222.2 84% 4.9%)",
                        },
                    },
                }
            }
        }
    </script>
    <style>
        .bg-gradient {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }
        .train-pattern {
            background-image: url("data:image/svg+xml,%3Csvg width='60' height='60' viewBox='0 0 60 60' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='none' fill-rule='evenodd'%3E%3Cg fill='%23ffffff' fill-opacity='0.05'%3E%3Cpath d='M36 34v-4h-2v4h-4v2h4v4h2v-4h4v-2h-4zm0-30V0h-2v4h-4v2h4v4h2V6h4V4h-4zM6 34v-4H4v4H0v2h4v4h2v-4h4v-2H6zM6 4V0H4v4H0v2h4v4h2V6h4V4H6z'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E");
        }
    </style>
</head>
<body class="min-h-screen bg-gradient train-pattern">

<div class="flex items-center justify-center min-h-screen py-12 px-4 sm:px-6 lg:px-8">
    <div class="max-w-md w-full space-y-8">
        <div class="bg-white/95 backdrop-blur-sm rounded-lg shadow-xl p-8">
            <div class="text-center mb-8">
                <div class="mx-auto h-16 w-16 bg-primary rounded-full flex items-center justify-center mb-4">
                    <i class="fas fa-train text-primary-foreground text-2xl"></i>
                </div>
                <h2 class="text-3xl font-bold text-foreground">Welcome Back</h2>
                <p class="text-muted-foreground mt-2">Sign in to your account to continue</p>
            </div>

            <form id="passengerLoginForm" class="space-y-6">
                <div class="space-y-2">
                    <label for="email" class="text-sm font-medium text-foreground">Email Address</label>
                    <input
                            type="email"
                            id="email"
                            name="email"
                            class="flex h-11 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 transition-all duration-200"
                            placeholder="Enter your email address"
                            required
                    >
                    <div class="error-message text-sm text-destructive hidden"></div>
                </div>

                <div class="space-y-2">
                    <label for="password" class="text-sm font-medium text-foreground">Password</label>
                    <div class="relative">
                        <input
                                type="password"
                                id="password"
                                name="password"
                                class="flex h-11 w-full rounded-md border border-input bg-background px-3 py-2 pr-10 text-sm ring-offset-background placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 transition-all duration-200"
                                placeholder="Enter your password"
                                required
                        >
                        <button type="button" id="togglePassword" class="absolute inset-y-0 right-0 pr-3 flex items-center text-muted-foreground hover:text-foreground transition-colors duration-200">
                            <i class="fas fa-eye" id="passwordIcon"></i>
                        </button>
                    </div>
                    <div class="error-message text-sm text-destructive hidden"></div>
                </div>

                <div class="flex items-center justify-between">
                    <div class="flex items-center">
                        <input
                                id="remember"
                                name="remember"
                                type="checkbox"
                                class="h-4 w-4 rounded border border-input text-primary focus:ring-2 focus:ring-ring focus:ring-offset-2"
                        >
                        <label for="remember" class="ml-2 block text-sm text-muted-foreground">
                            Remember me
                        </label>
                    </div>
                    <a href="#" class="text-sm text-primary hover:underline">
                        Forgot password?
                    </a>
                </div>

                <button
                        type="submit"
                        id="submitBtn"
                        class="inline-flex items-center justify-center rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 bg-primary text-primary-foreground hover:bg-primary/90 h-11 px-4 py-2 w-full"
                >
                    <span class="button-text">Sign In</span>
                    <i class="fas fa-spinner fa-spin ml-2 hidden loading-spinner"></i>
                </button>
            </form>

            <div class="mt-6 text-center">
                <p class="text-sm text-muted-foreground">
                    Don't have an account?
                    <a href="/register" class="text-primary hover:underline font-medium">
                        Sign up here
                    </a>
                </p>
            </div>
        </div>
    </div>
</div>

<script>
    class PassengerLogin {
        constructor() {
            this.form = document.getElementById('passengerLoginForm');
            this.submitBtn = document.getElementById('submitBtn');
            this.buttonText = this.submitBtn.querySelector('.button-text');
            this.loadingSpinner = this.submitBtn.querySelector('.loading-spinner');

            this.validators = {
                email: /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/,
                password: /^.{1,}$/
            };

            this.init();
        }

        init() {
            this.bindEvents();
            this.setupPasswordToggle();
            this.loadRememberedEmail();
        }

        bindEvents() {
            this.form.addEventListener('submit', (e) => this.handleSubmit(e));

            Object.keys(this.validators).forEach(field => {
                const input = document.getElementById(field);
                if (input) {
                    input.addEventListener('blur', () => this.validateField(field));
                    input.addEventListener('input', () => this.clearError(field));
                    input.addEventListener('keypress', (e) => {
                        if (e.key === 'Enter') {
                            e.preventDefault();
                            this.handleSubmit(e);
                        }
                    });
                }
            });

            document.getElementById('email').focus();
        }

        setupPasswordToggle() {
            const toggleBtn = document.getElementById('togglePassword');
            const passwordInput = document.getElementById('password');
            const passwordIcon = document.getElementById('passwordIcon');

            toggleBtn.addEventListener('click', () => {
                const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
                passwordInput.setAttribute('type', type);
                passwordIcon.className = type === 'password' ? 'fas fa-eye' : 'fas fa-eye-slash';
            });
        }

        loadRememberedEmail() {
            const rememberedEmail = localStorage.getItem('rememberedPassengerEmail');
            if (rememberedEmail) {
                document.getElementById('email').value = rememberedEmail;
                document.getElementById('remember').checked = true;
                document.getElementById('password').focus();
            }
        }

        saveRememberedEmail() {
            const rememberCheckbox = document.getElementById('remember');
            const emailInput = document.getElementById('email');

            if (rememberCheckbox.checked) {
                localStorage.setItem('rememberedPassengerEmail', emailInput.value.trim());
            } else {
                localStorage.removeItem('rememberedPassengerEmail');
            }
        }

        validateField(fieldName) {
            const input = document.getElementById(fieldName);
            const errorDiv = input.parentElement.querySelector('.error-message') ||
                input.parentElement.parentElement.querySelector('.error-message');
            const value = input.value.trim();

            if (!value) {
                this.showError(errorDiv, `${this.formatFieldName(fieldName)} is required`);
                return false;
            }

            if (value && !this.validators[fieldName].test(value)) {
                this.showError(errorDiv, this.getValidationMessage(fieldName));
                return false;
            }

            this.hideError(errorDiv);
            return true;
        }

        formatFieldName(fieldName) {
            return fieldName.replace(/([A-Z])/g, ' $1').replace(/^./, str => str.toUpperCase());
        }

        getValidationMessage(fieldName) {
            const messages = {
                email: 'Please enter a valid email address',
                password: 'Password is required'
            };
            return messages[fieldName];
        }

        showError(errorDiv, message) {
            errorDiv.textContent = message;
            errorDiv.classList.remove('hidden');
            errorDiv.previousElementSibling.classList.add('border-destructive');
        }

        hideError(errorDiv) {
            errorDiv.classList.add('hidden');
            errorDiv.previousElementSibling.classList.remove('border-destructive');
        }

        clearError(fieldName) {
            const input = document.getElementById(fieldName);
            const errorDiv = input.parentElement.querySelector('.error-message') ||
                input.parentElement.parentElement.querySelector('.error-message');
            this.hideError(errorDiv);
        }

        validateForm() {
            const requiredFields = ['email', 'password'];
            let isValid = true;

            requiredFields.forEach(field => {
                if (!this.validateField(field)) {
                    isValid = false;
                }
            });

            return isValid;
        }

        setLoading(loading) {
            if (loading) {
                this.submitBtn.disabled = true;
                this.buttonText.textContent = 'Signing In...';
                this.loadingSpinner.classList.remove('hidden');
            } else {
                this.submitBtn.disabled = false;
                this.buttonText.textContent = 'Sign In';
                this.loadingSpinner.classList.add('hidden');
            }
        }

        async handleSubmit(e) {
            e.preventDefault();

            if (!this.validateForm()) {
                return;
            }

            this.setLoading(true);

            const formData = new FormData(this.form);
            const loginData = {
                email: formData.get('email').trim(),
                password: formData.get('password')
            };

            try {
                const response = await fetch('/api/passengers/login', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify(loginData)
                });

                if (response.ok) {
                    const passenger = await response.json();

                    this.saveRememberedEmail();
                    localStorage.setItem("userId",passenger.id)
                    sessionStorage.setItem('passengerSession', JSON.stringify({
                        id: passenger.id,
                        firstName: passenger.firstName,
                        lastName: passenger.lastName,
                        email: passenger.email,
                        loginTime: new Date().toISOString()
                    }));

                    this.showSuccess('Login successful! Redirecting...');

                    setTimeout(() => {
                        window.location.href = '/';
                    }, 1500);
                } else {
                    const error = await response.text();
                    this.showError(null, error || 'Invalid email or password');
                }
            } catch (error) {
                this.showError(null, 'Network error. Please check your connection and try again.');
            } finally {
                this.setLoading(false);
            }
        }

        showSuccess(message) {
            const existingAlert = document.querySelector('.success-alert');
            if (existingAlert) {
                existingAlert.remove();
            }

            const alert = document.createElement('div');
            alert.className = 'success-alert fixed top-4 right-4 bg-green-50 border border-green-200 text-green-800 px-4 py-3 rounded-md shadow-lg flex items-center space-x-2 z-50 animate-pulse';
            alert.innerHTML = `
            <i class="fas fa-check-circle text-green-600"></i>
            <span>${message}</span>
        `;

            document.body.appendChild(alert);

            setTimeout(() => {
                alert.remove();
            }, 3000);
        }

        showError(errorDiv, message) {
            if (errorDiv) {
                errorDiv.textContent = message;
                errorDiv.classList.remove('hidden');
                return;
            }

            const existingAlert = document.querySelector('.error-alert');
            if (existingAlert) {
                existingAlert.remove();
            }

            const alert = document.createElement('div');
            alert.className = 'error-alert fixed top-4 right-4 bg-red-50 border border-red-200 text-red-800 px-4 py-3 rounded-md shadow-lg flex items-center space-x-2 z-50';
            alert.innerHTML = `
            <i class="fas fa-exclamation-triangle text-red-600"></i>
            <span>${message}</span>
            <button onclick="this.parentElement.remove()" class="ml-2 text-red-600 hover:text-red-800">
                <i class="fas fa-times"></i>
            </button>
        `;

            document.body.appendChild(alert);

            setTimeout(() => {
                if (alert.parentElement) {
                    alert.remove();
                }
            }, 5000);
        }
    }

    document.addEventListener('DOMContentLoaded', () => {
        new PassengerLogin();
    });
</script>
</body>
</html>