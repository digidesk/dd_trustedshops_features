[{if count( $aLanguages )}]
<form class="form" action="[{$oViewConf->getSelfLink()}]" method="POST">
    <div class="hidden">
        [{$oViewConf->getHiddenSid()}]
        <input type="hidden" name="cl" value="dd_trustedshops_features">
        <input type="hidden" name="fnc" value="saveTSID">
        <input type="hidden" name="id" value="[{$oData->langid|default:"-1"}]">
    </div>
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="[{oxmultilang ident="CLOSE"}]"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="modal_TSIDLabel">[{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_ID_MODAL_ADD_EDIT_TITLE"}]</h4>
    </div>
    [{/if}]
    <div class="modal-body">
        [{if count( $aLanguages )}]
            [{assign var="aTSIDs" value=$oTsIdModel->getAll()}]
            <div class="row">
                <div class="text-center">
                    <img src="[{$oView->getInfoPictureUrl()}]">
                </div>
                <div class="dd-register-btn text-center">
                    <a href="https://business.trustedshops.de/shopsoftware/oxid?&a_aid=Oxid" class="btn btn-primary text-center">[{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_REGISTER"}]</a>
                </div>
            </div>
            <div class="spacer"></div>
            <div class="form-group dd-form-help">
                <label for="DD_TRUSTEDSHOPS_FEATURES_ID_MODAL_ADD_EDIT_TSID">[{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_ID_MODAL_ADD_EDIT_TSID"}]</label>
                <i id="dd-switch-id-help" class="fa fa-question dd-help-block" title="[{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_ID_INFO"}]" data-toggle="tooltip"></i>
                <input name="editval[tsid]" type="text" class="form-control required" id="DD_TRUSTEDSHOPS_FEATURES_ID_MODAL_ADD_EDIT_TSID" required="required" value="[{$oData->tsid}]">
            </div>

            <div class="form-group">
                <label for="DD_TRUSTEDSHOPS_FEATURES_ID_MODAL_ADD_EDIT_LANGUAGE">[{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_ID_MODAL_ADD_EDIT_LANGUAGE"}]</label>
                <select name="editval[langid]" class="form-control" id="DD_TRUSTEDSHOPS_FEATURES_ID_MODAL_ADD_EDIT_LANGUAGE">
                    [{foreach from=$aLanguages item="oLang"}]
                        [{assign var="iLangId" value=$oLang->id}]
                        [{if !isset($aTSIDs.$iLangId)}]
                            <option value="[{$iLangId}]"[{if $oData->langid == $iLangId}] selected="selected"[{/if}]>[{$oLang->name}]</option>
                        [{/if}]
                    [{/foreach}]
                </select>
            </div>
        [{else}]
            <p class="alert alert-info">
                <i class="fa fa-info-circle"></i> [{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_ALERTS_NOLANGUAGES"}]
            </p>
        [{/if}]
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">[{oxmultilang ident="CLOSE"}]</button>
        [{if count( $aLanguages )}]
            <button type="submit" class="btn btn-primary">[{oxmultilang ident="SAVE"}]</button>
        [{/if}]
    </div>
    [{if count( $aLanguages )}]
</form>
[{/if}]