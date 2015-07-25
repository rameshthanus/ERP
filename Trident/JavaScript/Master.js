/// <reference path="../assets/global/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js" />
/// <reference path="../assets/admin/pages/scripts/table-advanced.js" />
/// <reference path="../assets/admin/pages/scripts/table-advanced.js" />
/// <reference path="../assets/admin/pages/scripts/table-advanced.js" />
function include(file) {

    var script = document.createElement('script');
    script.src = file;
    script.type = 'text/javascript';
    script.defer = true;

    document.getElementsByTagName('head').item(0).appendChild(script);

}

function includecss(files) {
    var fileref = document.createElement("link")
    fileref.setAttribute("rel", "stylesheet")
    fileref.setAttribute("type", "text/css")
    fileref.setAttribute("href", files)
    document.getElementsByTagName('head').item(0).appendChild(fileref);
}

/* include any js files here */

includecss('../assets/global/plugins/font-awesome/css/font-awesome.min.css');
includecss('../assets/global/plugins/simple-line-icons/simple-line-icons.min.css');
includecss('../assets/global/plugins/bootstrap/css/bootstrap.min.css');
includecss('../assets/global/plugins/uniform/css/uniform.default.css');
includecss('../assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css');
includecss('../Css/font.css');
includecss('../assets/global/plugins/select2/select2.css');
includecss('../assets/global/css/components.css');
includecss('../assets/global/css/plugins.css');
includecss('../assets/admin/layout2/css/layout.css');
includecss('../assets/admin/layout2/css/themes/default.css');
includecss('../assets/admin/layout2/css/custom.css');

include('../JavaScript/jquery-1.9.1.min.js');
include('../JavaScript/comman_Validation.js');
include('../assets/global/plugins/jquery-1.11.0.min.js');
include('../assets/global/plugins/jquery-migrate-1.2.1.min.js');
include('../assets/global/plugins/jquery-ui/jquery-ui-1.10.3.custom.min.js');
include('../assets/global/plugins/bootstrap/js/bootstrap.min.js');
include('../assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js');
include('../assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js');
include('../assets/global/plugins/jquery.blockui.min.js');
include('../assets/global/plugins/jquery.cokie.min.js');
include('../assets/global/plugins/uniform/jquery.uniform.min.js');
include('../assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js');
include('../assets/global/plugins/select2/select2.min.js')
include('../assets/global/scripts/metronic.js');
include('../assets/admin/layout2/scripts/layout.js');
include('../assets/admin/layout2/scripts/demo.js');
include('../assets/global/plugins/bootstrap/js/bootstrap.js');
include('../assets/global/plugins/bootstrap/js/bootstrap.min.js');


//include('../assets/admin/pages/scripts/form-samples.js');
include('../JavaScript/Layout.js');
include('../assets/global/plugins/bootbox/bootbox.min.js');


//include('../assets/admin/pages/scripts/table-advanced.js');
//include('../assets/global/plugins/select2/select2.min.js');
//include('../assets/global/plugins/datatables/media/js/jquery.dataTables.min.js');
//include('../assets/global/plugins/datatables/extensions/TableTools/js/dataTables.tableTools.min.js');
//include('../assets/global/plugins/datatables/extensions/ColReorder/js/dataTables.colReorder.min.js');
//include('../assets/global/plugins/datatables/extensions/Scroller/js/dataTables.scroller.min.js');
//include('../assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js');


function callalert(title, content, type) {
    $('#basic1').empty();
    var str = '<div class="modal-dialog">';
    str += '<div class="modal-content">';
    str += '<div class="modal-header">';
    str += '<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>';
    str += '<h4 class="modal-title">' + title + '</h4>';
    str += '</div>';
    str += '<div class="modal-body">';
    str += ' <img src="../assets/admin/layout/img/1429184960_messagebox_warning.png" height="48px" width="48px" alt=""> ' + content;
    str += '</div>';
    str += ' <div class="modal-footer">';
    switch (type) {
        case "1":
            str += ' <input type="button" id="btn_Cancel" class="btn blue" data-dismiss="modal" value="Close">';
            break;
        case "2":
            str += ' <input type="button" id="btn_OK" class="btn blue"  value="OK">';
            str += ' <input type="button" id="btn_Cancel" class="btn blue" data-dismiss="modal" value="Close">';
    }

    str += ' </div>';
    str += ' </div>';
    str += ' </div>';
    return str;
}




