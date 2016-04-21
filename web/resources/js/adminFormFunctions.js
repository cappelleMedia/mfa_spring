var pollItemAnswers = 0;
function addField(elementID, optionalVal) {
    var count = 0;
    var inputName = ' ';
    if (optionalVal === undefined) {
        optionalVal = '';
    }
    if (elementID === 'pollAnswers') {
        pollItemAnswers += 1;
        count = pollItemAnswers;
        inputName = 'answers';
    }
    var newFields = document.getElementById(elementID + 'ClnMaterial').cloneNode(true);
    newFields.id += '_' + count;
    newFields.attributes.removeNamedItem('style');
    var newField = newFields.childNodes;
    for (var i = 0, len = newField.length; i < len; i += 1) {
        var field = newField[i];
        field.id = count + '_' + field.id;
        if (field.tagName === 'INPUT') {
            field.name = inputName;
            field.value = optionalVal;
            field.required = true;
        }

    }
    var insertHere = document.getElementById(elementID + 'Writeroot');
    insertHere.parentNode.insertBefore(newFields, insertHere);
}
function removeField(elementID, numberOf) {
    var numberOfInt = parseInt(numberOf, 10);
    if (elementID === 'pollAnswers') {
        pollItemAnswers -= 1;
    }
    var parentID = elementID + 'ClnMaterial_' + numberOfInt;
    var removeFromHere = document.getElementById(parentID);
    removeFromHere.parentNode.removeChild(removeFromHere);
}

function switchLoginRegisterFrom() {
    toggleLoginForm();
    toggleRegisterForm();
}

function toggleLoginForm() {
    if (toggleDisplay('loginForm')) {
        toggleFocus('loginName');
    }
}

function toggleRegisterForm() {
    if (toggleDisplay('registerForm')) {
        toggleFocus('username');
        $('#submitButton').prop('disabled', true);
    }
}

function toggleFocus(elementID) {
    $('#' + elementID).focus();
}

function toggleDisplay(elementID) {
    var emId = '#' + elementID;
    if ($(emId).is(':hidden')) {
        $(emId).show();
        return true;
    } else {
        $(emId).hide();
        return false;
    }
}

function setSuccesState(elementIdFirstPart) {
    $('#' + elementIdFirstPart + '-form-group').removeClass('has-error');
    $('#' + elementIdFirstPart + '-errorIcon').addClass('hidden');
    $('#' + elementIdFirstPart + '-errorSR').addClass('hidden');
    $('#' + elementIdFirstPart + '-errorSR').removeClass('sr-only');
    $('#' + elementIdFirstPart + '-form-group').addClass('has-success');
    $('#' + elementIdFirstPart + '-successIcon').removeClass('hidden');
    $('#' + elementIdFirstPart + '-successSR').removeClass('hidden');
    $('#' + elementIdFirstPart + '-successSR').addClass('sr-only');

}

function setErrorState(elementIdFirstPart) {
    $('#' + elementIdFirstPart + '-form-group').removeClass('has-success');
    $('#' + elementIdFirstPart + '-successIcon').addClass('hidden');
    $('#' + elementIdFirstPart + '-successSR').addClass('hidden');
    $('#' + elementIdFirstPart + '-successSR').removeClass('sr-only');
    $('#' + elementIdFirstPart + '-form-group').addClass('has-error');
    $('#' + elementIdFirstPart + '-errorIcon').removeClass('hidden');
    $('#' + elementIdFirstPart + '-errorSR').removeClass('hidden');
    $('#' + elementIdFirstPart + '-errorSR').addClass('sr-only');
}

function passwordsCheck() {
    if (!passwordsCheckHelper()) {
        setErrorState('pwc');
        setErrorState('pw');
        $('#submitButton').prop('disabled', true);
    } else {
        setSuccesState('pw');
        setSuccesState('pwc');
        $('#submitButton').prop('disabled', false);
    }
}

function passwordsCheckHelper() {
    var string1 = $('#pw');
    var string2 = $('#pwc');

    if (string1.val().length !== 0 && string2.val().length !== 0) {
        if (string1.val() === string2.val()) {
            return true;
        }
    }
    return false;
}

function changePwToggle() {
    if ($('#pw-change').is(':hidden')) {
        $('#pw-btn-inner').html('Cancel change password');
        $('#pw-change').show();
        $('#submitButton').prop('disabled', true);
    } else {
        $('#pw-btn-inner').html('Change password');
        $('#pw-change').hide();
        $('#pw').val('');
        $('#pwc').val('');
        $('#submitButton').prop('disabled', false);
    }
}

$(document).ready(function () {
    $('#form').submit(function (event) {
        if (!$('#pw').val() && !$('#pwc').val()) {
            $('#pw').val(oldPw);
            $('#pwc').val(oldPw);
        }
    });
}); //Realy unsafe!!!

//function found on htmlgoodies, written by Simon Willison
function addLoadEvent(func) {
    var oldonload = window.onload;
    if (typeof window.onload !== 'function') {
        window.onload = func;
    } else {
        window.onload = function () {
            if (oldonload) {
                oldonload();
            }
            func();
        }
    }
}