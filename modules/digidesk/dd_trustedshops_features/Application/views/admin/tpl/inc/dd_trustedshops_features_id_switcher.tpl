[{assign var="aTSIDs" value=$oTsIdModel->getAll()}]
[{assign var="iActiveTSID" value=$oView->getActiveTSID()}]
[{assign var="oActiveTSID" value=$oTsIdModel->get($iActiveTSID)}]

<div class="dd-tsid-switcher[{if count($aTSIDs)}] dd-tsid-switcher-filled[{/if}]">
    <div class="btn-group">
        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            [{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_ID_SWITCHER_BUTTON"}][{if $oActiveTSID}] ([{$oActiveTSID->lang_abbr|strtoupper}])[{/if}] <span class="caret"></span>
        </button>
        <ul class="dropdown-menu pull-right">
            [{foreach from=$aTSIDs key="sId" item="oTsId"}]
                <li[{if $sId == $oView->getActiveTSID()}] class="active"[{/if}]>
                    <a href="#" data-target="#modal_TSID" data-content-id="[{$sId}]">
                        <span class="dd-title">([{$oTsId->lang_abbr}]) [{$oTsId->tsid}]</span>
                        <span class="dd-delete pull-right">
                            <button type="button" class="btn btn-danger btn-xs has-tooltip dd-delete-button" data-placement="left" title="[{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_ID_SWITCHER_DELETE"}]">
                                <i class="fa fa-times dd-delete-button"></i>
                            </button>
                        </span>
                        [{*<span class="dd-edit pull-right">
                            <button type="button" class="btn btn-warning btn-xs has-tooltip dd-edit-button" data-placement="left" title="[{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_ID_SWITCHER_EDIT"}]">
                                <i class="fa fa-pencil dd-edit-button"></i>
                            </button>
                        </span>*}]
                        <span class="clearfix"></span>
                    </a>
                </li>
            [{/foreach}]
            [{if count($aTSIDs)}]
                <li role="separator" class="divider"></li>
            [{/if}]
            <li><a href="#" class="dd-add-button" data-target="#modal_TSID" data-content-id="-1"><i class="fa fa-plus"></i> <span class="dd-title">[{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_ID_SWITCHER_ADD_NEW"}]</span></a></li>
        </ul>
    </div>
</div>

<div class="modal fade[{if count($aTSIDs) == 0}] in[{/if}]" id="modal_TSID" tabindex="-1" role="dialog" aria-labelledby="modal_TSIDLabel" data-content-tpl="forms/dd_trustedshops_features_tsid_modal.tpl" data-content-id="-1">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-body"></div>
        </div>
    </div>
</div>