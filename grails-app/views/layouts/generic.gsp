<g:set var="orgNameLong" value="${grailsApplication.config.skin.orgNameLong}"/>
<g:set var="orgNameShort" value="${grailsApplication.config.skin.orgNameShort}"/>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <alatag:addApplicationMetaTags />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    %{--<link rel="shortcut icon" type="image/x-icon" href="favicon.ico">--}%

    <title><g:layoutTitle /></title>
    <g:render template="/layouts/global"/>
    <r:require modules="bootstrap, hubCore" />
    <style type="text/css">
    body {
        background-color: #ffffff !important;
    }
    #breadcrumb {
        margin-top: 10px;
    }
    #main-content #searchInfoRow #customiseFacetsButton > .dropdown-menu {
        background-color: #ffffff;
    }
    #footer {
        padding-top: 15px;
        align-content: center;
        width: 100%;


    }
    
    #footer img{
        width: 100%;
    }
    
    #content .nav-tabs > li.active > a {
        background-color: #ffffff;
    }

    .navbar-default {
        background-color: #2d607b;
        padding-top: 10px;
    }

    .nav {
        margin-top: 20px;
    }
    body > #main-content {
        margin-top: 0px;
    }
    .wide {
        width:100%;
        background-size:cover;
    }
    
    .wide img{
        width: 100%;
    }

    .navbar-default .navbar-inner .nav-collapse .nav .dropdown-menu {
        background-color: #0081c6;
        color:#000000;
    }

    </style>
    <r:script disposition='head'>
        // initialise plugins
        jQuery(function(){
            // autocomplete on navbar search input
            jQuery("form#search-form-2011 input#search-2011, form#search-inpage input#search, input#search-2013").autocomplete('http://bie.ala.org.au/search/auto.jsonp', {
                extraParams: {limit: 100},
                dataType: 'jsonp',
                parse: function(data) {
                    var rows = new Array();
                    data = data.autoCompleteList;
                    for(var i=0; i<data.length; i++) {
                        rows[i] = {
                            data:data[i],
                            value: data[i].matchedNames[0],
                            result: data[i].matchedNames[0]
                        };
                    }
                    return rows;
                },
                matchSubset: false,
                formatItem: function(row, i, n) {
                    return row.matchedNames[0];
                },
                cacheLength: 10,
                minChars: 3,
                scroll: false,
                max: 10,
                selectFirst: false
            });

            // Mobile/desktop toggle
            // TODO: set a cookie so user's choice is remembered across pages
            var responsiveCssFile = $("#responsiveCss").attr("href"); // remember set href
            $(".toggleResponsive").click(function(e) {
                e.preventDefault();
                $(this).find("i").toggleClass("icon-resize-small icon-resize-full");
                var currentHref = $("#responsiveCss").attr("href");
                if (currentHref) {
                    $("#responsiveCss").attr("href", ""); // set to desktop (fixed)
                    $(this).find("span").html("Mobile");
                } else {
                    $("#responsiveCss").attr("href", responsiveCssFile); // set to mobile (responsive)
                    $(this).find("span").html("Desktop");
                }
            });

            $('.helphover').popover({animation: true, trigger:'hover'});
        });
    </r:script>
    <r:layoutResources/>
    <g:layoutHead />
</head>
<body class="${pageProperty(name:'body.class')?:'nav-collections'}" id="${pageProperty(name:'body.id')}" onload="${pageProperty(name:'body.onload')}">
<g:set var="fluidLayout" value="${grailsApplication.config.skin.fluidLayout?.toBoolean()}"/>
<div class="wide">

    <div style="background-image: url('${resource(dir: "images", file: "header-full-SIB2.gif")}'); background-size: 100% 100%; background-repeat: no-repeat; height: 150px;">
        <a style="float: left; padding-top: 20px; padding-left: 30px" href="http://www.gbif.ad" target="_blank"><r:img dir="images" file="logo_white.png" alt="logo-gbif-ad" title="Logo GBIF Andorra"/></a>
        <div style="text-align: center">
            <div><p style="color:white; display: inline-block; *display: inline; /* IE7 fix for inline-block */ *zoom: 1; /* IE7 fix for inline-block */font-size: 3rem; padding-top: 40px">Global Biodiversity Information Facility</br></br> Andorra</p></div></div>

    </div>
</div>


<div style="padding-top: -20px"></div>
<div class="navbar navbar-default" role="navigation">
    <div class="navbar-inner">
        <div class="${fluidLayout?'container-fluid':'container'}">
            <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="brand" href="/generic-hub">SIBAD - <g:message code="header.menu.09" default="Data access"/></a>
            <div class="nav-collapse collapse">
                <p class="hide navbar-text pull-right">
                    Logged in as <a href="#" class="navbar-link">${username}</a>
                </p>
                <ul class="nav">
                    <li><a href="http://www.gbif.ad"><g:message code="header.menu.05" default="Home"/></a></li>
                    <li><a href="/generic-hub/"><g:message code="header.menu.00" default="Search"/></a></li>
                    <li><a href="/generic-hub/occurrences/search?q=*:*&fq=#tab_mapView"><g:message code="header.menu.01" default="Record Map"/></a></li>
                    <li><a href="/collectory/"><g:message code="header.menu.02" default="Institutions and Collections"/></a></li>
                    <li><a href="/collectory/datasets"><g:message code="header.menu.03" default="Data bases"/></a></li>
                    %{--<li><a href="/generic-hub/explore/your-area?default=true"><g:message code="header.menu.04" default="Explore by area"/></a></li>--}%
                </ul>
                <ul  class="nav pull-right">
                    <li class="dropdown" style="margin-left: 5px">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <g:message code="header.menu.07" default="Language"/>
                            <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu" style="color: #0081c6">
                            <li style="margin-left: 20px; color: #0081c6">
                                <langs:selector langs="ca"/>
                            </li>
                            <li style="margin-left: 20px; color: #0081c6">
                                <langs:selector langs="es"/>
                            </li>
                            <li style="margin-left: 20px; color: #0081c6">
                                <langs:selector langs="en"/>
                            </li>
                        </ul>
                    </li>
                    %{--}<li class="divider-vertical"></li>
                    <li>
                        <a href="source/manual_ayuda-gbif-andorra.pdf"><g:message code="header.menu.08" default="Documentation"/></a>
                    </li>--}%
                </ul>
            </div><!--/.nav-collapse -->
        </div><!--/.container-fluid -->
    </div><!--/.navbar-inner -->
</div><!--/.navbar -->



<div class="${fluidLayout?'container-fluid':'container'}" id="main-content">
    <g:layoutBody />
</div><!--/.container-->

<div id="footer">
    <!--<r:img dir="images" file="footer.jpg" alt="Footer" title="Sistema de Información para la Biodiversidad GBIF Andorra"/></div>
    <div class="container-fluid">
        <div class="row-fluid">

        </div>
    </div>-->
</div><!--/#footer -->
<br/>

<!-- JS resources-->
<r:layoutResources/>
</body>
</html>