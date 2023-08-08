<hr/>

<p class="lead">[{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_CUSTOMER_REVIEWS_TITLE"}]</p>

<div class="row">
    <div class="col-xs-12 col-sm-6">
        <div class="form-group">
            <label for="settings_standard_review_sticker" class="control-label">[{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_CUSTOMER_REVIEWS_REVIEW_STICKER"}]</label>
            <select id="settings_standard_review_sticker" class="form-control" name="settings_standard[review_sticker]">
                <option value="0"[{if !$oData->review_sticker}] selected="selected"[{/if}]>[{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_CUSTOMER_REVIEWS_REVIEW_STICKER_0"}]</option>
                <option value="1"[{if $oData->review_sticker == '1'}] selected="selected"[{/if}]>[{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_CUSTOMER_REVIEWS_REVIEW_STICKER_1"}]</option>
                <option value="2"[{if $oData->review_sticker == '2'}] selected="selected"[{/if}]>[{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_CUSTOMER_REVIEWS_REVIEW_STICKER_2"}]</option>
            </select>
        </div>

        [{*<div class="form-group settings_standard_review_sticker_position">
            <label for="settings_standard_review_sticker_position" class="control-label">[{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_CUSTOMER_REVIEWS_REVIEW_STICKER_POSITION"}]</label>
            <select id="settings_standard_review_sticker_position" class="form-control" name="settings_standard[review_sticker_position]">
                <option value="skyscraper_horizontal"[{if $oData->review_sticker_position == 'skyscraper_horizontal'}] selected="selected"[{/if}]>[{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_CUSTOMER_REVIEWS_REVIEW_STICKER_POSITION_0"}]</option>
                <option value="skyscraper_vertical"[{if $oData->review_sticker_position == 'skyscraper_vertical'}] selected="selected"[{/if}]>[{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_CUSTOMER_REVIEWS_REVIEW_STICKER_POSITION_1"}]</option>
            </select>
        </div>*}]
        <input type="hidden" name="settings_standard[review_sticker_position]" value="skyscraper_horizontal">

        <div class="settings_standard_note_sticker_group">
            <div class="form-group settings_standard_note_sticker_font">
                <label for="settings_standard_note_sticker_font" class="control-label">[{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_CUSTOMER_REVIEWS_NOTE_STICKER_FONT"}]</label>
                <select id="settings_standard_note_sticker_font" class="form-control" name="settings_standard[note_sticker_font]">
                    <option value="Arial"[{if $oData->note_sticker_font == 'Arial'}] selected="selected"[{/if}]>Arial</option>
                    <option value="Geneva"[{if $oData->note_sticker_font == 'Geneva'}] selected="selected"[{/if}]>Geneva</option>
                    <option value="Georgia"[{if $oData->note_sticker_font == 'Georgia'}] selected="selected"[{/if}]>Georgia</option>
                    <option value="Helvetica"[{if $oData->note_sticker_font == 'Helvetica'}] selected="selected"[{/if}]>Helvetica</option>
                    <option value="Sans-serif"[{if $oData->note_sticker_font == 'Sans-serif'}] selected="selected"[{/if}]>Sans-serif</option>
                    <option value="Serif"[{if $oData->note_sticker_font == 'Serif'}] selected="selected"[{/if}]>Serif</option>
                    <option value="Trebuchet MS"[{if $oData->note_sticker_font == 'Trebuchet MS'}] selected="selected"[{/if}]>Trebuchet MS</option>
                    <option value="Verdana"[{if $oData->note_sticker_font == 'Verdana'}] selected="selected"[{/if}]>Verdana</option>
                </select>
            </div>

            <div class="form-group settings_standard_note_sticker_reviews_amount">
                <label for="settings_standard_note_sticker_reviews_amount" class="control-label">[{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_CUSTOMER_REVIEWS_NOTE_STICKER_REVIEWS"}]</label>
                <select id="settings_standard_note_sticker_reviews_amount" class="form-control" name="settings_standard[note_sticker_reviews_amount]">
                    <option value="1"[{if $oData->note_sticker_reviews_amount == '1'}] selected="selected"[{/if}]>1</option>
                    <option value="2"[{if $oData->note_sticker_reviews_amount == '2'}] selected="selected"[{/if}]>2</option>
                    <option value="3"[{if $oData->note_sticker_reviews_amount == '3'}] selected="selected"[{/if}]>3</option>
                    <option value="4"[{if $oData->note_sticker_reviews_amount == '4'}] selected="selected"[{/if}]>4</option>
                    <option value="5"[{if $oData->note_sticker_reviews_amount == '5'}] selected="selected"[{/if}]>5</option>
                </select>
            </div>

            <div class="form-group settings_standard_note_sticker_min_rating">
                <label for="settings_standard_note_sticker_min_rating" class="control-label">[{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_CUSTOMER_REVIEWS_NOTE_STICKER_BETTER_THAN"}]</label>
                <select id="settings_standard_note_sticker_min_rating" class="form-control" name="settings_standard[note_sticker_min_rating]">
                    <option value="0.0"[{if $oData->note_sticker_min_rating == '0.0'}] selected="selected"[{/if}]>0.0</option>
                    <option value="0.5"[{if $oData->note_sticker_min_rating == '0.5'}] selected="selected"[{/if}]>0.5</option>
                    <option value="1.0"[{if $oData->note_sticker_min_rating == '1.0'}] selected="selected"[{/if}]>1.0</option>
                    <option value="1.5"[{if $oData->note_sticker_min_rating == '1.5'}] selected="selected"[{/if}]>1.5</option>
                    <option value="2.0"[{if $oData->note_sticker_min_rating == '2.0'}] selected="selected"[{/if}]>2.0</option>
                    <option value="2.5"[{if $oData->note_sticker_min_rating == '2.5'}] selected="selected"[{/if}]>2.5</option>
                    <option value="3.0"[{if $oData->note_sticker_min_rating == '3.0'}] selected="selected"[{/if}]>3.0</option>
                    <option value="3.5"[{if $oData->note_sticker_min_rating == '3.5'}] selected="selected"[{/if}]>3.5</option>
                    <option value="4.0"[{if $oData->note_sticker_min_rating == '4.0'}] selected="selected"[{/if}]>4.0</option>
                    <option value="4.5"[{if $oData->note_sticker_min_rating == '4.5'}] selected="selected"[{/if}]>4.5</option>
                    <option value="5.0"[{if $oData->note_sticker_min_rating == '5.0'}] selected="selected"[{/if}]>5.0</option>
                </select>
            </div>

            <div class="settings_standard_note_sticker_bg">
                <label for="settings_standard_note_sticker_bg" class="control-label">[{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_CUSTOMER_REVIEWS_NOTE_STICKER_BG"}]</label>
                <div class="form-group">
                    <input type="text" class="dd-colorpicker form-control" id="settings_standard_note_sticker_bg" name="settings_standard[note_sticker_bg]"
                           value="[{$oData->note_sticker_bg}]">
                </div>
            </div>
        </div>

        <div>
            <div class="form-group dd-form-help">
                <label for="settings_standard_rich_snippets" class="control-label">[{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_CUSTOMER_REVIEWS_GOOGLE_RICH_SNIPPETS_TITLE"}]</label>
                <select id="settings_standard_rich_snippets" class="form-control" name="settings_standard[rich_snippets]">
                    <option value="0"[{if !$oData->rich_snippets}] selected="selected"[{/if}]>[{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_PRODUCT_STICKER_DEACTIVATE"}]</option>
                    <option value="1"[{if $oData->rich_snippets == '1'}] selected="selected"[{/if}]>[{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_PRODUCT_STICKER_ACTIVATE"}]</option>
                </select>
                <i class="fa fa-question dd-help-block" title="[{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_CUSTOMER_REVIEWS_GOOGLE_RICH_SNIPPETS_INFO"}]" data-toggle="tooltip"></i>
            </div>

            <div class="settings_standard_rich_snippets_group">
                <div class="checkbox">
                    <label>
                        <input type="hidden" name="settings_standard[google_rich_snippets][home_page]" value="0"/>
                        <input type="checkbox" name="settings_standard[google_rich_snippets][home_page]" value="1"[{if $oData->google_rich_snippets->home_page}] checked="checked"[{/if}]> [{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_CUSTOMER_REVIEWS_GOOGLE_RICH_SNIPPETS_HOME_PAGE"}]
                    </label>
                </div>

                <div class="checkbox">
                    <label>
                        <input type="hidden" name="settings_standard[google_rich_snippets][category_pages]" value="0"/>
                        <input type="checkbox" name="settings_standard[google_rich_snippets][category_pages]" value="1"[{if $oData->google_rich_snippets->category_pages}] checked="checked"[{/if}]> [{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_CUSTOMER_REVIEWS_GOOGLE_RICH_SNIPPETS_CATEGORY_PAGE"}]
                    </label>
                </div>

                <div class="checkbox">
                    <label>
                        <input type="hidden" name="settings_standard[google_rich_snippets][details_pages]" value="0"/>
                        <input type="checkbox" name="settings_standard[google_rich_snippets][details_pages]" value="1"[{if $oData->google_rich_snippets->details_pages}] checked="checked"[{/if}]> [{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_CUSTOMER_REVIEWS_GOOGLE_RICH_SNIPPETS_DETAILS_PAGE"}]
                    </label>
                </div>
            </div>
        </div>

    </div>
</div>