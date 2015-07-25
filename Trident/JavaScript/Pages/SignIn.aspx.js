var usernameInputText = $("#UsernameInputText");
var passwordInputPassword = $("#PasswordInputPassword");
var rememberInputCheckBox = $("#RememberInputCheckBox");
var branchSelect = $("#BranchSelect");
var CompanySelect = $("#CompanySelect");
//var languageSelect = $("#LanguageSelect");
var signInButton = $("#SignInButton");

$(document).ready(function () {
    if ($.cookie('UserName') != null && $.cookie('Password') != null) {
        usernameInputText.val($.cookie('UserName'));
        passwordInputPassword.val($.cookie('Password'));
    }
    else {
       // usernameInputText.val('admin');
       // passwordInputPassword.val('appu');
    }
    $("#RememberInputCheckBox").prop("checked", true);
    $(".ui.checkbox").checkbox();
  
    var message = getQueryStringByName("Message");

    if (message) {
        $(".exception").append(message).addClass("big error");
        makeDirty();
    };
});

signInButton.click(function () {
    $(".dimmer").dimmer('show');

    var username = usernameInputText.val();
    var rememberMe = rememberInputCheckBox.is(":checked");
    var branchId = parseInt2(branchSelect.getSelectedValue());
    var BranchName = branchSelect.text();
    var CompanyId = parseInt2(CompanySelect.getSelectedValue());
    var CompanyName = CompanySelect.text();
    var password = passwordInputPassword.val();
    var rememberMe = rememberInputCheckBox.is(":checked");
    //var password = getPassword(username, passwordInputPassword.val(), challenge);

    var ajaxAuthenticate = authenticate(username, password, rememberMe, CompanyId, branchId, BranchName, CompanyName, rememberMe);

    $(".form").addClass("loading");

    ajaxAuthenticate.success(function (msg) {
        if (msg.d === "SUCCESS") {
            //window.location = getRedirectUrl();
            window.location.href = 'HomeHeader.aspx';
            return;
        };

        window.location = window.location.href.split('?')[0] + "?Message=" + msg.d;
    });

    ajaxAuthenticate.fail(function (xhr) {
        logAjaxErrorMessage(xhr);
        makeDirty();
        $(".dimmer").dimmer('hide');
    });
});

function getRedirectUrl() {
    var url = getQueryStringByName("ReturnUrl");

    if (isNullOrWhiteSpace(url)) {
        url = "/";
    };


    return url;
};
$(document).on('change', '#CompanySelect', function () {
    if ($('#CompanySelect').val() != 0)
        Bind();
    else {
        alert('Please select Companny!')
    }
});

function makeDirty() {
    $(".field").addClass("error");
};

function authenticate(username, password, rememberMe, CompanyId, branchId, BranchName, CompanyName, rememberMe) {
    //var url = "/Services/User.asmx/Authenticate";
    var url = "HttpHandler/Login.asmx/Authenticate";
    // var data = appendParameter("", "username", username);
    var data = appendParameter("", "LoginID", username);
    data = appendParameter(data, "LoginPassword", password);
    data = appendParameter(data, "BranchID", branchId);
    data = appendParameter(data, "CompanyID", CompanyId);
    data = appendParameter(data, "BranchName", BranchName);
    data = appendParameter(data, "CompanyName", CompanyName);
    data = appendParameter(data, "rememberMe", rememberMe);

    data = getData(data);

    return getAjax(url, data);
};

function getPassword(username, password, token) {
    var hex = new jsSHA(username + password, 'TEXT').getHash('SHA-512', 'HEX');
    hex = new jsSHA(hex + token, 'TEXT').getHash('SHA-512', 'HEX');

    return hex;
};

function Bind() {
    $("#BranchSelect").empty();
    var Parameters = {
        UserID: 0,
        UserGroupID: 0,
        LoginID: usernameInputText.val(),
        LoginPassword: passwordInputPassword.val(),
        Imode: 'GetBranch',
        BranchID: parseInt2(branchSelect.getSelectedValue()),
        CompanyID: parseInt2(CompanySelect.getSelectedValue()),
        PasswordCompanyID: parseInt2(CompanySelect.getSelectedValue()),
        EmailID: '',
        hmode: 'search'
    }
    $.ajax({
        url: "HttpHandler/Login.ashx",
        data: Parameters,
        cache: false,
        success: function (data) {
            if (data.length > 0) {

                for (var i = 0; i < data.length; i++) {
                    //if (data[i].CompanyName != null) {
                    //    $("#F_V_ddl_Company").append($("<option></option>").val(data[i].CompanyID).html(data[i].CompanyName));
                    //}
                    //else
                    if (data[i].BranchName != null) {
                        $("#BranchSelect").append($("<option></option>").val(data[i].BranchID).html(data[i].BranchName));
                    }
                }
            }
            //  $('#F_V_ddl_Company option[value=1]').attr('selected', 'selected');
            //  $('#F_V_ddl_Branch option[value=9]').attr('selected', 'selected');
        },
        error: function (result) {
            alert("Error");
        }
    });
}
$(document).keyup(function (e) {
    if (e.ctrlKey && e.which === 13) {
        if (!$(".form").hasClass("loading")) {
            signInButton.trigger("click");
        };
    };
});
