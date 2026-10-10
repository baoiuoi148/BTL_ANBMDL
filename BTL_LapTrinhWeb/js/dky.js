function togglePassword(inputId, iconId) {
    const input = document.getElementById(inputId);
    const icon = document.getElementById(iconId);
    if (input.type === "password") {
        input.type = "text";
        icon.src = "../assest/icon/mattat.svg";
        icon.alt = "Ẩn mật khẩu";
    } else {
        input.type = "password";
        icon.src = "../assest/icon/matbat.svg";
        icon.alt = "Hiện mật khẩu";
    }
}

function validateRegister() {
    let fullname = document.getElementById("fullname");
    let email = document.getElementById("email");
    let username = document.getElementById("username");
    let pass = document.getElementById("register-password");
    let confirm = document.getElementById("confirm-password");
    let ok = true;
    let errFull = document.getElementById("errFullname");
    let errEmail = document.getElementById("errEmail");
    let errUser = document.getElementById("errUsername");
    let errPass = document.getElementById("errPassword");
    let errCon = document.getElementById("errConfirm");

    let inputs = [fullname, email, username, pass, confirm];
    let errors = [errFull, errEmail, errUser, errPass, errCon];

    inputs.forEach(i => i.classList.remove("input-error"));
    errors.forEach(e => {
        e.classList.remove("show");
        e.innerText = "";
    });

    let empty = /^\s*$/;
    let emailRex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    let userRex = /^[a-zA-Z0-9_]{4,20}$/;

    if (empty.test(fullname.value)) {
        errFull.innerText = "Không được để trống";
        errFull.classList.add("show");
        fullname.classList.add("input-error");
        ok = false;
    }
    var isSql = email.value.indexOf("'") !== -1 || username.value.indexOf("'") !== -1 || fullname.value.indexOf("'") !== -1;

    if (empty.test(email.value)) {
        errEmail.innerText = "Không được để trống";
        errEmail.classList.add("show");
        email.classList.add("input-error");
        ok = false;
    }
    else if (!emailRex.test(email.value) && !isSql) {
        errEmail.innerText = "Email không hợp lệ";
        errEmail.classList.add("show"); 
        email.classList.add("input-error");
        ok = false;
    }

    if (empty.test(username.value)) {
        errUser.innerText = "Không được để trống";
        errUser.classList.add("show");
        username.classList.add("input-error");
        ok = false;
    }
    else if (!userRex.test(username.value) && !isSql) {
        errUser.innerText = "4-20 ký tự, không dấu";
        errUser.classList.add("show");
        username.classList.add("input-error");
        ok = false;
    }
    

    if (empty.test(pass.value)) {
        errPass.innerText = "Không được để trống";
        errPass.classList.add("show");
        pass.classList.add("input-error");
        ok = false;
    }
    if (empty.test(confirm.value)) {
        errCon.innerText = "Không được để trống";
        errCon.classList.add("show");
        confirm.classList.add("input-error");
        ok = false;
    }
    else if (confirm.value !== pass.value) {
        errCon.innerText = "Mật khẩu không khớp";
        errCon.classList.add("show");
        confirm.classList.add("input-error");
        ok = false;
    }
    return ok;
}
