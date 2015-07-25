

function validate(obj,errormsg, errorid, tofocus) {
    if (EmptyStringValidation(obj, errormsg, errorid, tofocus) == false) {
        return false;
    }

    return true;
}




function cal_Readonly() {

    $(".cls_disabled,.butt_Save,.top-input").attr('disabled', 'disabled');
   
}


function DropdownValidation(obj, msg, errorid, tofocus) {
    var dropdownvalue = obj.value.trim();
    

    if (dropdownvalue == 0) {
        printError(errorid, msg, obj, tofocus);
        return false;
    }
    else {
        clearError(errorid, "*", "", obj, tofocus);
    }
    return true;
}

function validatationControl(obj, errormsg, errorid, tofocus) {
    if (Validation(obj, errormsg, errorid, tofocus) == false) {
        return false;
    }

    return true;
}


function Validation(obj, msg, errorid, tofocus) {
    var Usernamevalue = obj.value.trim();
    if (Usernamevalue == 'Name' || Usernamevalue == 'Email' || Usernamevalue == 'Mobile') {
        printError(errorid, msg, obj, tofocus);
        return false;
    }
    else {
        clearError(errorid, "*", "", obj, tofocus);
    }

    return true;
}




function loginvalidateusername(obj, errorid, tofocus) {
    if (EmptyStringValidation(obj,errorid, tofocus) == false) {
        return false;
    }

    if (NotAllowedSpacebar(obj, 'Sorry, you are not allowed to enter any spaces.', errorid, tofocus) == false) {
        return false;
    }

    return true;
}

function UserNameValidation(obj, errorid, tofocus) {
    if (EmptyStringValidation(obj, 'Username should not be left empty', errorid, tofocus) == false) {
        return false;
    }

    if (NotAllowedSpacebar(obj, 'Sorry, you are not allowed to enter any spaces.', errorid, tofocus) == false) {
        return false;
    }
    return true;
}

function PasswordValidation(obj, errorid, tofocus) {
    if (EmptyStringValidation(obj, 'Please enter New Password', errorid, tofocus) == false) {
        return false;
    }   
    return true;
}


function SMTPPasswordValidation(obj, errorid, tofocus) {
    if (EmptyStringValidation(obj, 'Please enter SMTP Password', errorid, tofocus) == false) {
        return false;
    }
    return true;
}


function OldPasswordValidation(obj, errorid, tofocus) {
    if (EmptyStringValidation(obj, 'Old Password should not be left empty', errorid, tofocus) == false) {
        return false;
    }
    return true;
}

function NewPasswordValidation(obj, errorid, tofocus) {
    if (EmptyStringValidation(obj, 'New Password should not be left empty', errorid, tofocus) == false) {
        return false;
    }
    return true;
}

function RetypeNewPasswordValidation(obj1, obj2, operator, errorid, tofocus) {
    if (EmptyStringValidation(obj2, 'Please enter Retype New Password', errorid, tofocus) == false) {
        return false;
    }

    if (CompareValidation(obj1, obj2, operator, 'New Password and Retype Password should be same.', errorid, tofocus) == false) {
        return false;
    }
    return true;
}


function SMTPRetypeNewPasswordValidation(obj1, obj2, operator, errorid, tofocus) {
    if (EmptyStringValidation(obj2, 'Please enter the Retype SMTP Password', errorid, tofocus) == false) {
        return false;
    }

    if (CompareValidation(obj1, obj2, operator, 'SMTP Password and Retype SMTP Password should be same.', errorid, tofocus) == false) {
        return false;
    }
    return true;
}

function RetypePasswordValidation(obj1,obj2,operator, errorid, tofocus) {
    if (EmptyStringValidation(obj2, 'Please enter Retype New Password', errorid, tofocus) == false) {
        return false;
    }

    if (CompareValidation(obj1, obj2, operator, 'New Password and Retype Password should be same.', errorid, tofocus) == false) {
        return false;
    }
    return true;
}

function EmailValidationfr(obj, errorid, tofocus) {
    if (EmptyStringValidation(obj, 'veuillez entrer votre adresse E-mail', errorid, tofocus) == false) {
        return false;
    }
    if (EmailvalidateForm(obj, 'Id invalide Email', errorid, tofocus) == false) {
       return false;
    }
    return true;
}


function EmailValidationgr(obj, errorid, tofocus) {
    if (EmptyStringValidation(obj, 'Ihre E-mail-Adresse', errorid, tofocus) == false) {
        return false;
    }
    if (EmailvalidateForm(obj, 'Ungültige E-Mail Id', errorid, tofocus) == false) {
        return false;
    }
    return true;
}

function EmailValidation(obj, errorid, tofocus) {
    if (EmptyStringValidation(obj, 'Please enter Email Id', errorid, tofocus) == false) {
        return false;
    }
    if (EmailvalidateForm(obj, 'Invalid Email Id', errorid, tofocus) == false) {
        return false;
    }
    return true;
}


function SMTPEmailValidation(obj, errorid, tofocus) {
    if (EmptyStringValidation(obj, 'Please enter SMTP Username(Email Id)', errorid, tofocus) == false) {
        return false;
    }
    if (EmailvalidateForm(obj, 'Invalid SMTP Username(Email Id)', errorid, tofocus) == false) {
        return false;
    }
    return true;
}


function EmailvalidateForm(obj, msg, errorid, tofocus) {
    var x = obj.value.trim();
    var atpos = x.indexOf("@");
    var dotpos = x.lastIndexOf(".");
    if (atpos < 1 || dotpos < atpos + 2 || dotpos + 2 >= x.length) {
        printError(errorid, msg, obj, tofocus);
        return false;
    }
    return true;
}



function MobileCodeValidation(obj, errorid, tofocus) {
    if (EmptyStringValidation(obj, 'Mobile Code should not be left empty', errorid, tofocus) == false) {
        return false;
    }
    return true;
}

function MobileNumberValidation(obj, errorid, tofocus) {
    
        var dropdownvalue = obj.value.trim();


        if (dropdownvalue == 10) {
            printError(obj, errorid, tofocus);
            return false;
        
    }
    
    return true;
}

function PhoneCodeValidation(obj, errorid, tofocus) {
    if (EmptyStringValidation(obj, 'Landline Code should not be left empty', errorid, tofocus) == false) {
        return false;
    }
    return true;
}

function PhoneNumberValidation(obj, errorid, tofocus) {
    if (EmptyStringValidation(obj, 'Landline Number should not be left empty', errorid, tofocus) == false) {
        return false;
    }
    return true;
}

function EmptyStringValidation(obj,msg, errorid, tofocus) {    
    var Usernamevalue = obj.value.trim();
    if (Usernamevalue == '') {
        printError(errorid, msg, obj, tofocus);
        return false;
    }
    else {
        clearError(errorid, "*", "", obj, tofocus);
    }

    return true;
}


function AlreadyExist(obj, msg, errorid, tofocus) {   
        printError(errorid, msg, obj, tofocus);
        return false;    
}

function NotAllowedSpacebar(obj, msg, errorid, tofocus) {
    var t = obj;
    if (t.value.match(/\s/g)) {
        //alert('Sorry, you are not allowed to enter any spaces');
        t.value = t.value.replace(/\s/g, '');

        printError(errorid, msg, obj, tofocus);
       return false;
    }
    return true;
}

function CompareValidation(obj1, obj2, Opertor, msg, errorid, tofocus) {
    var Source=obj1;
    var Desination=obj2;
    var Op=Opertor;
    if (Op == '=') {
        if (Source.value != Desination.value) {
            printError(errorid, msg, obj2, tofocus);
            return false;
        }
    }
    return true;
}

function printError(errorid, innerHtmlValue, fieldId, tofocus) {    
    tofocus = (tofocus == 1) ? 1 : '';
    var errorDivId = document.getElementById(errorid);
    errorDivId.innerHTML = innerHtmlValue;
    if (fieldId != "") {        
        if (innerHtmlValue != "") {            
            if (tofocus == 1) {                
                fieldId.focus();
            }
            //fieldId.className = "ErrorInput_TextBox";            
            fieldId.style.border = '1px solid #FF6100';
            return false;
        } else if (innerHtmlValue == "") {
            //fieldId.className = "valid";
            fieldId.style.border = '1px solid #ACACAC';
            return true;
        }
    }

    


      //Function to allow only numbers to textbox
      function ValidateOnlyNumeric(key,clientid) {
          //getting key code of pressed key
          var keycode = (key.which) ? key.which : key.keyCode;
          var phn = document.getElementById(clientid);
          //comparing pressed keycodes
          if (!(keycode == 8 || keycode == 46) && (keycode < 48 || keycode > 57)) {
              return false;
          }
          else {
              
          }
      }



//    if ($(errorDivId).value) {
//		$(errorDivId).style.display = displayType;
//		$(errorDivId).innerHTML     = innerHtmlValue;
//		if(fieldId!=""){
//			if(innerHtmlValue!=""){
//				if(tofocus==1){
//					fieldId.focus();
//				}
//    				fieldId.className = "ErrorInput_TextBox";
//				return false;
//			}else if(innerHtmlValue==""){
//				fieldId.className = "valid";
//				return true;
//			}
//		}
//	}
}

function clearError(errorid, innerHtmlValue, displayType, fieldId, tofocus) {    
    var errorDivId = document.getElementById(errorid);
    errorDivId.innerHTML = innerHtmlValue;
    //fieldId.className = "Input_TextBox";
    fieldId.style.border = '1px solid #ACACAC';
}