// DATA_TEMPLATE: empty_table
oTest.fnStart("oLanguage.sZeroRecords");

$(document).ready(function () {
    /* Check the default */
    var oTable = $('#example').dataTable({
        "bServerSide": true,
        "sAjaxSource": "../../../examples/server_side/scripts/server_processing.php"
    });
    var oSettings = oTable.fnSettings();

    oTest.fnWaitTest(
        "Zero records language is 'No matching records found' by default",
        null,
        function () {
            return oSettings.oLanguage.sZeroRecords == "No matching records found";
        }
    );

    oTest.fnWaitTest(
        "Text is shown when empty table (after filtering)",
        function () {
            oTable.fnFilter('nothinghere');
        },
        function () {
            if ($('#example tbody tr td').length == 0)
                return false;
            return $('#example tbody tr td')[0].innerHTML == "No matching records found";
        }
    );


    oTest.fnWaitTest(
        "Zero records language can be defined",
        function () {
            oSession.fnRestore();
            oTable = $('#example').dataTable({
                "bServerSide": true,
                "sAjaxSource": "../../../examples/server_side/scripts/server_processing.php",
                "oLanguage": {
                    "sZeroRecords": "unit test"
                }
            });
            oSettings = oTable.fnSettings();
        },
        function () {
            return oSettings.oLanguage.sZeroRecords == "unit test";
        }
    );

    oTest.fnWaitTest(
        "Text is shown when empty table (after filtering)",
        function () {
            oTable.fnFilter('nothinghere2');
        },
        function () {
            if ($('#example tbody tr td').length == 0)
                return false;
            return $('#example tbody tr td')[0].innerHTML == "unit test"
        }
    );


    oTest.fnComplete();
});