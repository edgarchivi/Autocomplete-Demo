<%@ Page Title="jQuery UI" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="jQuery UI.aspx.cs" Inherits="AutocompleteDemo.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

    <h2><%: Title %>.</h2>
    <h3>Demo Autocomplete using: <%: Title %></h3>

    <p>Reference: <a href="https://api.jqueryui.com/autocomplete/">Autocomplete Jquery UI</a> </p>

    <script type="text/javascript">
        $(function () {
            var availableTags = [
                "ActionScript",
                "AppleScript",
                "Asp",
                "BASIC",
                "C",
                "C++",
                "Clojure",
                "COBOL",
                "ColdFusion",
                "Erlang",
                "Fortran",
                "Groovy",
                "Haskell",
                "Java",
                "JavaScript",
                "Lisp",
                "Perl",
                "PHP",
                "Python",
                "Ruby",
                "Scala",
                "Scheme"
            ];
            function split(val) {
                return val.split(/;\s*/);
            }
            function extractLast(term) {
                return split(term).pop();
            }

            $("#tags")
                // don't navigate away from the field on tab when selecting an item
                .on("keydown", function (event) {
                    if (event.keyCode === $.ui.keyCode.TAB &&
                        $(this).autocomplete("instance").menu.active) {
                        event.preventDefault();
                    }
                })
                .autocomplete({
                    minLength: 0,
                    source: function (request, response) {
                        // delegate back to autocomplete, but extract the last term
                        response($.ui.autocomplete.filter(
                            availableTags, extractLast(request.term)));
                    },
                    focus: function () {
                        // prevent value inserted on focus
                        return false;
                    },
                    select: function (event, ui) {
                        var textBox = this.value;
                        var position = textBox.lastIndexOf(';');
                        var savedText = textBox.substring(0, position + 1);
                        var newText = savedText + ui.item.value + ": ";
                        this.value = newText;
                        return false;
                    }
                });
        });

    </script>

    <div class="ui-widget">
        <label for="tags">Add filter: </label>
        <input id="tags" size="50">
    </div>



</asp:Content>
