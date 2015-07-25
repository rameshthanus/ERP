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

includecss('assets/global/plugins/font-awesome/css/font-awesome.min.css');
includecss('assets/global/plugins/simple-line-icons/simple-line-icons.min.css');
includecss('assets/global/plugins/bootstrap/css/bootstrap.min.css');
includecss('assets/global/plugins/uniform/css/uniform.default.css');
includecss('assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css');
includecss('Css/font.css');
includecss('assets/global/plugins/select2/select2.css');
includecss('assets/global/css/components.css');
includecss('assets/global/css/plugins.css');
includecss('assets/admin/layout2/css/layout.css');
includecss('assets/admin/layout2/css/themes/default.css');
includecss('assets/admin/layout2/css/custom.css');
includecss('assets/global/plugins/bootstrap-modal/css/bootstrap-modal.css');
includecss('assets/global/plugins/bootstrap-datepicker/css/datepicker3.css');
includecss('assets/global/plugins/bootstrap-select/bootstrap-select.min.css');
includecss('assets/global/plugins/select2/select2.css');
includecss('assets/global/plugins/jquery-multi-select/css/multi-select.css');
includecss('assets/global/plugins/select2/select2.css');
includecss('assets/global/plugins/datatables/extensions/Scroller/css/dataTables.scroller.min.css');
includecss('assets/global/plugins/datatables/extensions/ColReorder/css/dataTables.colReorder.min.css');
includecss('assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css');

include('JavaScript/jquery-1.9.1.min.js');
include('assets/global/plugins/select2/select2.min.js');
include('assets/global/plugins/datatables/media/js/jquery.dataTables.js');
include('assets/global/plugins/datatables/media/js/jquery.dataTables.min.js');
include('assets/global/plugins/datatables/extensions/TableTools/js/dataTables.tableTools.js');
include('assets/global/plugins/datatables/extensions/TableTools/js/dataTables.tableTools.min.js');
include('assets/global/plugins/datatables/extensions/TableTools/js/dataTables.tableTools.min.js');
include('assets/global/plugins/datatables/extensions/ColReorder/js/dataTables.colReorder.min.js');
include('assets/global/plugins/datatables/extensions/Scroller/js/dataTables.scroller.min.js');
include('assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js');
include('assets/global/plugins/bootstrap/js/bootstrap.js');
include('assets/global/plugins/bootstrap/js/bootstrap.min.js');

function callalert(title, content, type) {
    $('#basic1').empty();
    var str = '<div class="modal-dialog">';
    str += '<div class="modal-content">';
    str += '<div class="modal-header">';
    str += '<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>';
    str += '<h4 class="modal-title">' + title + '</h4>';
    str += '</div>';
    str += '<div class="modal-body">';
    str += ' <img src="assets/admin/layout/img/1429184960_messagebox_warning.png" height="48px" width="48px" alt=""> ' + content;
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