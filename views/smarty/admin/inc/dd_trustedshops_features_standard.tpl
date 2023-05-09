<p class="lead">[{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_TRUSTBADGE_TITLE"}]</p>

<div class="row">
    <div class="col-xs-12 col-sm-6">
        <div class="form-group">
            <label class="control-label" for="settings_standard_trustbadge_variant">[{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_STANDARD_VARIANT_LABEL"}]</label>
            <select name="settings_standard[trustbadge_variant]" id="settings_standard_trustbadge_variant" class="form-control">
                <option value="reviews"[{if $oData->trustbadge_variant == 'reviews'}] selected="selected"[{/if}] data-preview-url="[{$oViewConf->getModuleUrl('dd_trustedshops_features',"img/tsbadge_reviews.png")}]">[{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_STANDARD_VARIANT_1"}]</option>
                <option value="default"[{if $oData->trustbadge_variant == 'default'}] selected="selected"[{/if}] data-preview-url="[{$oViewConf->getModuleUrl('dd_trustedshops_features',"img/tsbadge_default.png")}]">[{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_STANDARD_VARIANT_2"}]</option>
            </select>
        </div>

        <div class="form-group dd-form-help">
            <label class="control-label" for="settings_standard_trustbadge_offset">[{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_STANDARD_OFFSET"}]</label>
            <br>
            <input type="text" class="form-control" name="settings_standard[trustbadge_offset]" id="settings_standard_trustbadge_offset" value="[{$oData->trustbadge_offset}]"/>
            <i class="fa fa-question dd-help-block" title="[{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_STANDARD_TOP_OFFSET_INFO"}]" data-toggle="tooltip"></i>
        </div>
    </div>
</div>

[{oxscript add="$('[data-toggle=tooltip]').tooltip();"}]