<!DOCTYPE html>
<html>
    <head>
        <title>[{$title}]</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1, maximum-scale=1">

        <link href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,700' rel='stylesheet' type='text/css'>
        <link rel="shortcut icon" href="[{$oViewConf->getModuleUrl('digidesk','dd_trustedshops_features/ddicon.png')}]">

        [{assign var="oViewConf" value=$oView->getViewConfig()}]

        [{oxstyle}]

        <!--[if gte IE 9]>
        <style type="text/css">.dd-gradient { filter: none; }</style>
        <![endif]-->
    </head>
    <body>

        <div id="alert_success_save" class="alert alert-success text-center toast"><i class="fa fa-check"></i> [{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_ALERTS_SAVE_SUCCESS"}]</div>
        <div id="alert_error_save" class="alert alert-danger text-center toast"><i class="fa fa-exclamation-triangle"></i> <span>[{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_ALERTS_SAVE_SUCCESS"}]</span></div>

        <main>
            <div class="container">
                <div id="main-content" class="panel panel-default">
                    <div class="panel-heading dd-gradient dd-gradient-secondary">
                        <div class="row">
                            <div class="col-xs-6">
                                <h1 class="panel-title">[{$title}]</h1>
                            </div>
                            <div class="col-xs-6">
                                <img class="dd-panel-title-img pull-right" src="[{$oViewConf->getModuleUrl('digidesk','dd_trustedshops_features/out/img/e-trustedshops.svg')}]" alt="Trusted Shops"/>
                                [{include file="inc/dd_trustedshops_features_id_switcher.tpl"}]
                            </div>
                        </div>

                        [{foreach from=$header item="_block"}][{$_block}][{/foreach}]
                    </div>
                    <div class="panel-body">
                        <div class="dd-content">
                            [{foreach from=$content item="_block"}][{$_block}][{/foreach}]
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <div class="hidden">
            <div class="text-center text-muted dd-modal-loading-content">
                <i class="fa fa-spinner fa-pulse"></i> [{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_MODAL_LOADING"}]
            </div>
        </div>

        <script type="text/javascript">
            var sAdminSid   = '[{$sAdminSid}]';
            var sAdminToken = '[{$sAdminToken}]';
            var sShopId     = '[{$sShopId}]';
            var sSelfLink   = '[{$oViewConf->getSelfLink()|html_entity_decode}]';
        </script>

        [{foreach from=$modal item="_block"}]
            [{$_block}]
        [{/foreach}]

        [{oxscript}]
    </body>
</html>