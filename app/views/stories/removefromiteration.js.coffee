<% the_view = render "removefromiteration" %>
$("#<%= "iteration-button-" + dom_id(@story) %>").html '<%= escape_javascript(the_view) %>'