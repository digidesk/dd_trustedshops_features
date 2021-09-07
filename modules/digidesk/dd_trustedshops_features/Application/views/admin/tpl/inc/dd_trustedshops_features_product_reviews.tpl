<hr/>

<p class="lead">[{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_PRODUCT_STICKER_TITLE"}]</p>

<div class="row">
    <div class="col-xs-12 col-sm-12">
        <div class="form-group">
            <div class="checkbox">
                <label>
                    <input type="hidden" name="settings_standard[collect_product_reviews]" value="0"/>
                    <input type="checkbox" class="collect-product-reviews" name="settings_standard[collect_product_reviews]" value="1"[{if $oData->collect_product_reviews}] checked="checked"[{/if}]>
                    [{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_PRODUCT_STICKER_COLLECT"}]
                </label>
            </div>
        </div>
    </div>

    <div class="col-xs-12 col-sm-6">
        <div class="form-group">
            <div class="checkbox collect-product-reviews-details-tab">
                <label>
                    <input type="hidden" name="settings_standard[collect_product_reviews_details_tab]" value="0"/>
                    <input type="checkbox" name="settings_standard[collect_product_reviews_details_tab]" value="1"[{if $oData->collect_product_reviews_details_tab}] checked="checked"[{/if}]>
                    [{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_PRODUCT_STICKER_COLLECT_DETAILS_TAB"}]
                </label>
            </div>
        </div>
    </div>

    <div class="col-xs-12 col-sm-6">
        <div class="form-group">
            <div class="checkbox collect-product-reviews-details-star">
                <label>
                    <input type="hidden" name="settings_standard[collect_product_reviews_details_star]" value="0"/>
                    <input type="checkbox" name="settings_standard[collect_product_reviews_details_star]" value="1"[{if $oData->collect_product_reviews_details_star}] checked="checked"[{/if}]>
                    [{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_PRODUCT_STICKER_COLLECT_DETAILS_STARS"}]
                </label>
            </div>
        </div>
    </div>

    <div class="col-xs-12 col-sm-12">
        <div class="col-xs-12 col-sm-6">
            <div class="form-group">
                <div class="collect-product-reviews-details-tab-advanced">
                    <label for="settings_standard[collect_product_reviews_details_tab_name]" class="control-label">[{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_PRODUCT_STICKER_COLLECT_DETAILS_TAB_NAME"}]</label>
                    <div class="form-group dd-form-help">
                        <input type="text" class="form-control" id="settings_standard[collect_product_reviews_details_tab_name]" name="settings_standard[collect_product_reviews_details_tab_name]"
                               value="[{$oData->collect_product_reviews_details_tab_name}]">
                        <i class="fa fa-question dd-help-block" title="[{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_PRODUCT_STICKER_COLLECT_DETAILS_TAB_NAME_INFO"}]" data-toggle="tooltip"></i>
                    </div>

                    <label for="settings_standard[collect_product_reviews_details_tab_border]" class="control-label">[{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_PRODUCT_STICKER_COLLECT_DETAILS_TAB_BORDER"}]</label>
                    <div class="form-group">
                        <input type="text" class="dd-colorpicker form-control" id="settings_standard[collect_product_reviews_details_tab_border]" name="settings_standard[collect_product_reviews_details_tab_border]"
                               value="[{$oData->collect_product_reviews_details_tab_border}]">
                    </div>

                    <label for="settings_standard[collect_product_reviews_details_tab_color_stars]" class="control-label">[{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_PRODUCT_STICKER_COLLECT_DETAILS_TAB_COLOR_STARS"}]</label>
                    <div class="form-group">
                        <input type="text" class="dd-colorpicker form-control" id="settings_standard[collect_product_reviews_details_tab_color_stars]" name="settings_standard[collect_product_reviews_details_tab_color_stars]"
                               value="[{$oData->collect_product_reviews_details_tab_color_stars}]">
                    </div>

                    <label for="settings_standard[collect_product_reviews_details_tab_size_stars]" class="control-label">[{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_PRODUCT_STICKER_COLLECT_DETAILS_STARS_SIZE"}]</label>
                    <div class="form-group">
                        <input type="text" class="form-control" id="settings_standard[collect_product_reviews_details_tab_size_stars]" name="settings_standard[collect_product_reviews_details_tab_size_stars]"
                               value="[{$oData->collect_product_reviews_details_tab_size_stars}]">
                    </div>

                    <label for="settings_standard[collect_product_reviews_details_tab_color_bg]" class="control-label">[{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_PRODUCT_STICKER_COLLECT_DETAILS_TAB_COLOR_BG"}]</label>
                    <div class="form-group">
                        <input type="text" class="dd-colorpicker form-control" id="settings_standard[collect_product_reviews_details_tab_color_bg]" name="settings_standard[collect_product_reviews_details_tab_color_bg]"
                               value="[{$oData->collect_product_reviews_details_tab_color_bg}]">
                    </div>
                </div>
            </div>
        </div>

        <div class="col-xs-12 col-sm-6">
            <div class="form-group">
                <div class="collect-product-reviews-details-star-advanced">
                    <label for="settings_standard[collect_product_reviews_details_stars_color_stars]" class="control-label">[{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_PRODUCT_STICKER_COLLECT_DETAILS_TAB_COLOR_STARS"}]</label>
                    <div class="form-group">
                        <input type="text" class="dd-colorpicker form-control" id="settings_standard[collect_product_reviews_details_stars_color_stars]" name="settings_standard[collect_product_reviews_details_stars_color_stars]"
                               value="[{$oData->collect_product_reviews_details_stars_color_stars}]">
                    </div>

                    <label for="settings_standard[collect_product_reviews_details_stars_size]" class="control-label">[{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_PRODUCT_STICKER_COLLECT_DETAILS_STARS_SIZE"}]</label>
                    <div class="form-group">
                        <input type="text" class="form-control" id="settings_standard[collect_product_reviews_details_stars_size]" name="settings_standard[collect_product_reviews_details_stars_size]"
                               value="[{$oData->collect_product_reviews_details_stars_size}]">
                    </div>

                    <label for="settings_standard[collect_product_reviews_details_stars_font_size]" class="control-label">[{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_PRODUCT_STICKER_COLLECT_DETAILS_STARS_SIZE_FONT"}]</label>
                    <div class="form-group">
                        <input type="text" class="form-control" id="settings_standard[collect_product_reviews_details_stars_font_size]" name="settings_standard[collect_product_reviews_details_stars_font_size]"
                               value="[{$oData->collect_product_reviews_details_stars_font_size}]">
                    </div>


                    <div class="checkbox">
                        <div class="form-group dd-form-help">
                            <label>
                                <input type="hidden" name="settings_standard[collect_product_reviews_details_stars_hide_empty]" value="true"/>
                                <input type="checkbox" name="settings_standard[collect_product_reviews_details_stars_hide_empty]" value="false"[{if $oData->collect_product_reviews_details_stars_hide_empty == 'false'}] checked="checked"[{/if}]>
                                [{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_PRODUCT_STICKER_COLLECT_DETAILS_STARS_EMPTY"}]
                            </label>
                            <i class="fa fa-question dd-help-block" title="[{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_PRODUCT_STICKER_COLLECT_DETAILS_STARS_EMPTY_INFO"}]" data-toggle="tooltip"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Modal -->
<div id="dd-collect-product-reviews-modal" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-body">
                <p>[{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_PRODUCT_STICKER_COLLECT_MODAL"}]</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary text-center" data-dismiss="modal">[{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_PRODUCT_STICKER_COLLECT_MODAL_CONFIRM"}]</button>
            </div>
        </div>

    </div>
</div>