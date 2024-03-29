[{* 3 Infotext *}]
<div class="row">
    <div class="col-xs-12 col-sm-12">
        <div class="infoTextExpert">
            [{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_EXPERT_INFO_TEXT_1"}] <a href="[{$oView->getTestLink()}]" target="_blank">[{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_EXPERT_INFO_TEXT_2"}]</a> [{oxmultilang
            ident="DD_TRUSTEDSHOPS_FEATURES_EXPERT_INFO_TEXT_3"}]
        </div>
    </div>
</div>

<hr>
[{* 3 Trustbadge *}]
<p class="lead">[{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_TRUSTBADGE_TITLE"}]</p>
<div class="row">
    <div class="col-xs-12 col-sm-12">
        <div class="form-group">
            <textarea name="settings_expert[trustbadge_code]" id="settings_expert_trustbadge_code" class="form-control codearea" rows="6" placeholder="[{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_EXPERT_CODEAREA_PLACEHOLDER"}]">[{$oData->trustbadge_code}]</textarea>
        </div>
    </div>
</div>

<hr>
[{* 3.1 Bereich Produktbewertungen *}]
<p class="lead">[{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_PRODUCT_STICKER_TITLE"}]</p>
<div class="row">
    <div class="col-xs-12 col-sm-12">
        <div class="form-group">
            <div class="checkbox">
                <label>
                    <input type="hidden" name="settings_expert[collect_product_reviews_expert]" value="0"/>
                    <input type="checkbox" class="collect-product-reviews-expert" name="settings_expert[collect_product_reviews_expert]" value="1"[{if $oData->collect_product_reviews_expert}] checked="checked"[{/if}]>
                    [{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_PRODUCT_STICKER_COLLECT"}]
                </label>
            </div>
        </div>
    </div>

    <div class="col-xs-12 col-sm-6">
        <div class="checkbox collect-product-reviews-details-tab-expert">
            <label>
                <input type="hidden" name="settings_expert[collect_product_reviews_details_tab_expert]" value="0"/>
                <input type="checkbox" name="settings_expert[collect_product_reviews_details_tab_expert]" value="1"[{if $oData->collect_product_reviews_details_tab_expert}] checked="checked"[{/if}]>
                [{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_PRODUCT_STICKER_COLLECT_DETAILS_TAB"}]
            </label>
        </div>
    </div>

    <div class="col-xs-12 col-sm-6">
        <div class="checkbox collect-product-reviews-details-star-expert">
            <label>
                <input type="hidden" name="settings_expert[collect_product_reviews_details_star_expert]" value="0"/>
                <input type="checkbox" name="settings_expert[collect_product_reviews_details_star_expert]" value="1"[{if $oData->collect_product_reviews_details_star_expert}] checked="checked"[{/if}]>
                [{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_PRODUCT_STICKER_COLLECT_DETAILS_STARS"}]
            </label>
        </div>
    </div>

    <div class="col-xs-12 col-sm-12">
        <div class="col-xs-12 col-sm-6">
            <div class="collect-product-reviews-details-tab-advanced-expert">
                <label for="settings_expert[collect_product_reviews_details_tab_name_expert]" class="control-label">[{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_PRODUCT_STICKER_COLLECT_DETAILS_TAB_NAME"}]</label>
                <div class="form-group dd-form-help">
                    <input type="text" id="settings_expert[collect_product_reviews_details_tab_name_expert]" class="form-control" name="settings_expert[collect_product_reviews_details_tab_name_expert]"
                           value="[{$oData->collect_product_reviews_details_tab_name_expert}]">
                    <i class="fa fa-question dd-help-block" title="[{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_PRODUCT_STICKER_COLLECT_DETAILS_TAB_NAME_INFO"}]" data-toggle="tooltip"></i>
                </div>

                <div class="form-group">
                    <textarea name="settings_expert[product_sticker_code]" id="settings_expert_product_sticker_code" class="form-control codearea" rows="6" placeholder="[{oxmultilang
                    ident="DD_TRUSTEDSHOPS_FEATURES_EXPERT_CODEAREA_PLACEHOLDER"}]">[{$oData->product_sticker_code}]</textarea>
                </div>

                <label for="settings_expert[collect_product_reviews_details_tab_jquery_selector_expert]" class="control-label">[{oxmultilang
                    ident="DD_TRUSTEDSHOPS_FEATURES_PRODUCT_STICKER_COLLECT_DETAILS_TAB_JQUERY_SELECTOR_EXPERT"}]</label>
                <div class="form-group dd-form-help">
                    <input type="text" id="settings_expert[collect_product_reviews_details_tab_jquery_selector_expert]" class="form-control" name="settings_expert[collect_product_reviews_details_tab_jquery_selector_expert]"
                           value="[{$oData->collect_product_reviews_details_tab_jquery_selector_expert}]">
                    <i class="fa fa-question dd-help-block" title="[{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_PRODUCT_STICKER_COLLECT_DETAILS_TAB_JQUERY_SELECTOR_INFO_EXPERT"}]" data-toggle="tooltip"></i>
                </div>
            </div>
        </div>

        <div class="col-xs-12 col-sm-6">
            <div class="collect-product-reviews-details-star-advanced-expert">
                <div class="form-group">
                    <textarea name="settings_expert[product_sticker_tab_code]" id="settings_expert_product_sticker_tab_code" class="form-control codearea" rows="6" placeholder="[{oxmultilang
                    ident="DD_TRUSTEDSHOPS_FEATURES_EXPERT_CODEAREA_PLACEHOLDER"}]">[{$oData->product_sticker_tab_code}]</textarea>
                </div>

                <label for="settings_expert[collect_product_reviews_details_stars_jquery_selector_expert]" class="control-label">[{oxmultilang
                    ident="DD_TRUSTEDSHOPS_FEATURES_PRODUCT_STICKER_COLLECT_DETAILS_TAB_JQUERY_SELECTOR_EXPERT"}]</label>
                <div class="form-group dd-form-help">
                    <input type="text" id="settings_expert[collect_product_reviews_details_stars_jquery_selector_expert]" class="form-control" name="settings_expert[collect_product_reviews_details_stars_jquery_selector_expert]"
                           value="[{$oData->collect_product_reviews_details_stars_jquery_selector_expert}]">
                    <i class="fa fa-question dd-help-block" title="[{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_PRODUCT_STICKER_COLLECT_DETAILS_STARS_JQUERY_SELECTOR_INFO_EXPERT"}]" data-toggle="tooltip"></i>
                </div>
            </div>
        </div>
    </div>
</div>

<hr>
[{* 3.2 Bereich Konfigurieren Sie weitere Optionen *}]
<p class="lead">[{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_EXPERT_CONFIGURE_ADDITIONAL_OPTIONS"}]</p>
<div class="row">
    <div class="col-xs-12 col-sm-12">
        <div>
            <div class="form-group">
                <label for="settings_expert_review_sticker" class="control-label">[{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_CUSTOMER_REVIEWS_REVIEW_STICKER"}]</label>
                <select id="settings_expert_review_sticker" class="form-control" name="settings_expert[review_sticker_expert]">
                    <option value="0"[{if !$oData->review_sticker_expert}] selected="selected"[{/if}]>[{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_CUSTOMER_REVIEWS_REVIEW_STICKER_0"}]</option>
                    <option value="1"[{if $oData->review_sticker_expert == '1'}] selected="selected"[{/if}]>[{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_CUSTOMER_REVIEWS_REVIEW_STICKER_1"}]</option>
                    <option value="2"[{if $oData->review_sticker_expert == '2'}] selected="selected"[{/if}]>[{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_CUSTOMER_REVIEWS_REVIEW_STICKER_2"}]</option>
                </select>
            </div>

            <div class="settings_expert_review_group">
                <div class="form-group dd-ts-review-code">
                    <textarea name="settings_expert[review_code]" id="settings_expert_review_code" class="form-control codearea" rows="6" placeholder="[{oxmultilang
                    ident="DD_TRUSTEDSHOPS_FEATURES_EXPERT_CODEAREA_PLACEHOLDER"}]">[{$oData->review_code}]</textarea>
                </div>

                <div class="form-group dd-ts-comment-code">
                    <textarea name="settings_expert[comment_code]" id="settings_expert_comment_code" class="form-control codearea" rows="6" placeholder="[{oxmultilang
                    ident="DD_TRUSTEDSHOPS_FEATURES_EXPERT_CODEAREA_PLACEHOLDER"}]">[{$oData->comment_code}]</textarea>
                </div>

                <div class="settings_expert_review_jquery_selector_expert">
                    <label for="settings_expert[review_jquery_selector_expert]" class="control-label">[{oxmultilang
                        ident="DD_TRUSTEDSHOPS_FEATURES_PRODUCT_STICKER_COLLECT_DETAILS_TAB_JQUERY_SELECTOR_EXPERT"}]</label>
                    <div class="form-group dd-form-help">
                        <input type="text" id="settings_expert[review_jquery_selector_expert]" class="form-control" name="settings_expert[review_jquery_selector_expert]"
                               value="[{$oData->review_jquery_selector_expert}]">
                        <i class="fa fa-question dd-help-block" title="[{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_REVIEWS_JQUERY_SELECTOR_INFO_EXPERT"}]" data-toggle="tooltip"></i>
                    </div>
                </div>
            </div>
        </div>
        <div>
            <div class="form-group dd-form-help">
                <label for="settings_expert_rich_snippets" class="control-label">[{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_CUSTOMER_REVIEWS_GOOGLE_RICH_SNIPPETS_TITLE"}]</label>
                <select id="settings_expert_rich_snippets" class="form-control" name="settings_expert[rich_snippets_expert]">
                    <option value="0"[{if !$oData->rich_snippets_expert}] selected="selected"[{/if}]>[{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_PRODUCT_STICKER_DEACTIVATE"}]</option>
                    <option value="1"[{if $oData->rich_snippets_expert == '1'}] selected="selected"[{/if}]>[{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_PRODUCT_STICKER_ACTIVATE"}]</option>
                </select>
                <i class="fa fa-question dd-help-block" title="[{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_CUSTOMER_REVIEWS_GOOGLE_RICH_SNIPPETS_INFO"}]" data-toggle="tooltip"></i>
            </div>

            <div class="settings_expert_rich_snippets_group">
                <div class="checkbox">
                    <label>
                        <input type="hidden" name="settings_expert[google_rich_snippets_expert][home_page]" value="0"/>
                        <input type="checkbox" name="settings_expert[google_rich_snippets_expert][home_page]" value="1"[{if $oData->google_rich_snippets_expert->home_page}] checked="checked"[{/if}]> [{oxmultilang
                        ident="DD_TRUSTEDSHOPS_FEATURES_CUSTOMER_REVIEWS_GOOGLE_RICH_SNIPPETS_HOME_PAGE"}]
                    </label>
                </div>

                <div class="checkbox">
                    <label>
                        <input type="hidden" name="settings_expert[google_rich_snippets_expert][category_pages]" value="0"/>
                        <input type="checkbox" name="settings_expert[google_rich_snippets_expert][category_pages]" value="1"[{if $oData->google_rich_snippets_expert->category_pages}] checked="checked"[{/if}]> [{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_CUSTOMER_REVIEWS_GOOGLE_RICH_SNIPPETS_CATEGORY_PAGE"}]
                    </label>
                </div>

                <div class="checkbox">
                    <label>
                        <input type="hidden" name="settings_expert[google_rich_snippets_expert][details_pages]" value="0"/>
                        <input type="checkbox" name="settings_expert[google_rich_snippets_expert][details_pages]" value="1"[{if $oData->google_rich_snippets_expert->details_pages}] checked="checked"[{/if}]> [{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_CUSTOMER_REVIEWS_GOOGLE_RICH_SNIPPETS_DETAILS_PAGE"}]
                    </label>
                </div>

                <textarea name="settings_expert[rich_snippets_code]" id="settings_expert_rich_snippets_code" class="form-control codearea" rows="6" placeholder="[{oxmultilang
                ident="DD_TRUSTEDSHOPS_FEATURES_EXPERT_CODEAREA_PLACEHOLDER"}]">[{$oData->rich_snippets_code}]</textarea>
            </div>
        </div>
    </div>
</div>

<!-- Modal -->
<div id="dd-collect-product-reviews-expert-modal" class="modal fade" role="dialog">
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