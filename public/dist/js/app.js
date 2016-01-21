$(document).ready(function() {

    var locationPath = $(location).attr('pathname');
    var navbar = $('#navbar')
    var sidebar = $('#mainnav-menu-wrap');
    var algoliaSearch = $('#algoliaSearch');

    sidebar
        .find($("a[href='" + locationPath + "']"))
        .parent('li').addClass('active-link')
        .parents('ul').addClass('collapse in');

    $(algoliaSearch).on('keyup', function(event) {
        var results = searchAlgolia('employees', $(this).val());
    });

});

function supportLocalStorage() {
    return (('localStorage' in window) && window['localStorage'] !== null);
}

function searchAlgolia(indices, searchItem) {
    var client = algoliasearch('66YZNT1HOR', 'bfeef98dcdd2b98b60f8058718fc2e3e');
    var index = client.initIndex(indices);
    index.search(searchItem, {
        hitsPerPage: 5
    }, function(err, content) {
        if (err) return err;
        console.log(content);
    });
}
