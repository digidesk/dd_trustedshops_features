[{assign var="oViewConf" value=$oView->getViewConfig()}]
[{assign var="oConf" value=$oView->getConfig()}]
[{assign var="aTSIDs" value=$oTsIdModel->getAll()}]

[{oxstyle include=$oViewConf->getModuleUrl('dd_trustedshops_features','css/backend.min.css')}]

[{capture append="header"}][{/capture}]

[{capture append="content"}]
    [{if count($aTSIDs)}]
        <!-- Nav tabs -->
        <ul class="nav nav-tabs" role="tablist">
            <li[{if $oData->savedTab == 'standard' || !$oData->savedTab}] class="active"[{/if}]><a href="#standard" aria-controls="standard" role="tab" data-toggle="tab">[{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_TAB_STANDARD"}]</a></li>
            <li[{if $oData->savedTab == 'expert'}] class="active"[{/if}]><a href="#expert" aria-controls="expert" role="tab" data-toggle="tab">[{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_TAB_EXPERT"}]</a></li>
        </ul>

        <!-- Tab panes -->
        <div class="tab-content dd-mode-tabs">
            <div role="tabpanel" class="tab-pane[{if $oData->savedTab == 'standard' || !$oData->savedTab}] active[{/if}]" id="standard">
                <form class="form dd-form-ajax-submit" action="[{$oViewConf->getSelfLink()}]">
                    <div class="hidden">
                        [{$oViewConf->getHiddenSid()}]
                        <input type="hidden" name="cl" value="dd_trustedshops_features">
                        <input type="hidden" name="fnc" value="saveSettings">
                        <input type="hidden" name="ajax" value="1">
                        <input type="hidden" name="langid" value="[{$oView->getActiveTSID()}]">
                        <input type="hidden" name="savedTab" value="standard">
                    </div>

                    [{include file="inc/dd_trustedshops_features_standard.tpl"}]
                    [{include file="inc/dd_trustedshops_features_product_reviews.tpl"}]
                    [{include file="inc/dd_trustedshops_features_customer_reviews.tpl"}]

                    [{include file="inc/dd_trustedshops_features_form_footer.tpl"}]
                </form>
            </div>
            <div role="tabpanel" class="tab-pane[{if $oData->savedTab == 'expert'}] active[{/if}]" id="expert">
                <form class="form dd-form-ajax-submit" action="[{$oViewConf->getSelfLink()}]">
                    <div class="hidden">
                        [{$oViewConf->getHiddenSid()}]
                        <input type="hidden" name="cl" value="dd_trustedshops_features">
                        <input type="hidden" name="fnc" value="saveSettings">
                        <input type="hidden" name="ajax" value="1">
                        <input type="hidden" name="langid" value="[{$oView->getActiveTSID()}]">
                        <input type="hidden" name="savedTab" value="expert">
                    </div>

                    [{include file="inc/dd_trustedshops_features_expert.tpl"}]

                    [{include file="inc/dd_trustedshops_features_form_footer.tpl"}]
                </form>
            </div>
        </div>
    [{else}]
        <div class="dd-mode-tabs">
            <p class="alert alert-info">
                <i class="fa fa-info-circle"></i> [{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_ALERTS_NOTSIDS"}]
            </p>
        </div>
    [{/if}]
[{/capture}]

[{oxstyle  include=$oViewConf->getModuleUrl('dd_trustedshops_features','css/backend.min.css')}]
[{oxscript include=$oViewConf->getModuleUrl('dd_trustedshops_features','js/backend.min.js') priority=10}]

[{include file="dd_ts_admin_ui.tpl" title="DD_TRUSTED_SHOPS_INTEGRATION"|oxmultilangassign}]