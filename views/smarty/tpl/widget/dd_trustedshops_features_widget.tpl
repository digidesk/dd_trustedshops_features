[{assign var="oTSID" value=$oViewConf->getTSIDObj()}]
[{assign var="sLocale" value=$oViewConf->getTSLocale($oTSID->langid)}]

[{if $sFeature && $oTSID}]

    [{if $oViewConf->isRoxiveTheme()}]
        [{oxscript add="if(typeof oxAjax !== 'undefined'){oxAjax.evalScripts = function() {};}" priority=1}]
    [{/if}]

    [{if $sFeature == 'trustbadge'}]

        [{assign var="sCustomTrustbadgeCode" value=$oTSID->trustbadge_code|trim}]

        [{if $sCustomTrustbadgeCode && $oTSID->savedTab == 'expert'}]
            [{* Custom Trustbadge Code *}]
            <script type="text/javascript">
                [{capture assign="sTrustbadgeExpert"}]
                [{strip}]
                [{$sCustomTrustbadgeCode}]
                [{/strip}]
                [{/capture}]
            </script>
            [{oxscript add=$sTrustbadgeExpert}]
        [{elseif $oTSID->savedTab == 'standard'}]
            <script type="text/javascript">
                [{capture assign="sTrustbadgeStandard"}]
                [{strip}]
                (function () {
                    var _tsid   = '[{$oTSID->tsid}]';
                    _tsConfig   = {
                        'yOffset':            '[{$oTSID->trustbadge_offset}]', /* offset from page bottom */
                        'variant':            '[{$oTSID->trustbadge_variant}]', /* text, default, small, reviews, custom, custom_reviews */
                        'customElementId':    '', /* required for variants custom and custom_reviews */
                        'trustcardDirection': '', /* for custom variants: topRight, topLeft, bottomRight, bottomLeft */
                        'disableResponsive':  'false', /* deactivate responsive behaviour */
                        'disableTrustbadge':  'false' /* deactivate trustbadge */
                    };
                    var _ts     = document.createElement( 'script' );
                    _ts.type    = 'text/javascript';
                    _ts.charset = 'utf-8';
                    _ts.async   = true;
                    _ts.src     = '//widgets.trustedshops.com/js/' + _tsid + '.js';
                    var __ts    = document.getElementsByTagName( 'script' )[ 0 ];
                    __ts.parentNode.insertBefore( _ts, __ts );
                })();
                [{/strip}]
                [{/capture}]
            </script>
            [{oxscript add=$sTrustbadgeStandard}]
        [{/if}]
    [{elseif $sFeature == 'review_sticker'}]
        [{* Review Sticker Start *}]
        [{if $oTSID->savedTab == 'expert' && ( $oTSID->review_sticker_expert == '1' || $oTSID->review_sticker_expert == '2' )}]
            [{* Review Sticker Experte Start *}]
            [{if $oTSID->review_sticker_expert && $oTSID->review_sticker_expert == '2' }]
                [{assign var="sCustomReviewStickerCode" value=$oTSID->review_code|trim}]
            [{elseif $oTSID->review_sticker_expert && $oTSID->review_sticker_expert == '1' }]
                [{assign var="sCustomReviewStickerCode" value=$oTSID->comment_code|trim}]
            [{/if}]
            [{assign var="sElement" value=''}]
            [{if $oTSID->review_jquery_selector_expert != ''}]
                [{assign var="sElement" value=$oTSID->review_jquery_selector_expert}]
            [{/if}]

            <div class="clear"></div>
            <div id="dd-ts-pointer"></div>
            <script type="text/javascript">
                [{capture assign="sReviewStickerContent"}]
                if ( $( '[{$sElement}]' ).length )
                {
                    if ( '[{$sElement}]' === '#footer' )
                    {
                        $( '#dd-ts-pointer' ).html( "<div id=\"dd-ts-review-sticker-expert\" class=\"dd-ts-review_sticker-footer clear\">\n"
                                                    + "                    <div id=\"ts_reviewsticker\"></div>" );
                    }
                    else
                    {
                        $( '#dd-ts-pointer' ).html( "<div id=\"dd-ts-review-sticker-expert\" class=\"clear\" style=\"margin-bottom: 20px\">\n"
                                                    + "                    <div id=\"ts_reviewsticker\"></div>" );
                    }

                    function loadReviewSticker2()
                    {
                        if ( window.isReviewStickerVisible !== true )
                        {
                            window.isReviewStickerVisible = true;
                            [{$sCustomReviewStickerCode}]
                        }
                    }

                    $( window ).load( function () {
                        loadReviewSticker2();
                    } );
                    $( '#dd-ts-pointer' ).append( "</div>" );
                }
                [{/capture}]
            </script>
            [{oxscript add=$sReviewStickerContent}]

            <script type="text/javascript">
                [{capture assign="sMoveExpertReviews"}]
                [{strip}]
                if ( $( '[{$sElement}]' ).length )
                {
                    $( '#dd-ts-review-sticker-expert' ).prependTo( '[{$sElement}]' );
                }
                [{/strip}]
                [{/capture}]
            </script>
            [{oxscript add=$sMoveExpertReviews}]
            [{* Review Sticker Experte Ende *}]
        [{elseif $oTSID->savedTab == 'standard'}]
            [{* Review Sticker Standard Modus Bewertungssticker Start *}]
            [{if $sPlacement && $sPlacement == 'footer' && $oTSID->review_sticker == 2 && $oTSID->review_sticker_position == 'skyscraper_horizontal'}]
                [{* Review Sticker Standard Modus Bewertungssticker Footer Start *}]
                <div class="clear"></div>
                <div class="dd-ts-review_sticker-footer clear" style="padding-bottom: 0;">
                    <div id="ts_reviewsticker">&nbsp;</div>
                    <script type="text/javascript">
                        [{capture assign="sReviewStickerStandard"}]
                        [{strip}]
                        function loadReviewSticker()
                        {
                            _tsRatingConfig = {
                                tsid:               '[{$oTSID->tsid}]',
                                variant:            'skyscraper_horizontal',
                                reviews:            3,
                                richSnippets:       'on',
                                reviewMinLength:    '10',
                                fontColor:          '#333333',
                                backgroundColor:    '#ffffff',
                                linkColor:          '#333333',
                                quotationMarkColor: '#33333',
                                fontFamily:         'Helvetica'
                            };
                            var div         = document.getElementById( 'ts_reviewsticker' );

                            var _ts     = document.createElement( 'SCRIPT' );
                            _ts.type    = 'text/javascript';
                            _ts.async   = true;
                            _ts.charset = 'utf-8';
                            _ts.src     = '//widgets.trustedshops.com/reviews/tsSticker/tsSticker.js';
                            div.parentNode.insertBefore( _ts, div );
                            _tsRatingConfig.script = _ts;
                        }

                        $( window ).load( function () {
                            loadReviewSticker();
                        } );
                        [{/strip}]
                        [{/capture}]
                    </script>

                    [{oxscript add=$sReviewStickerStandard}]
                </div>
                [{* Review Sticker Standard Modus Bewertungssticker Footer Ende *}]
            [{elseif $oTSID->savedTab == 'standard' && ( $oTSID->review_sticker == 1 ) || ( $sPlacement && $sPlacement == 'sidebar' && ( ( $oTSID->review_sticker == 2 && $oTSID->review_sticker_position == 'skyscraper_vertical' ) || (
            $oTSID->review_sticker == 1 ) ))}]
                [{* Review Sticker Standard Modus Kommentar Sticker oder Bewertungssticker Sidebar Start *}]
                [{if $oTSID->review_sticker == 2 && $oTSID->review_sticker_position == 'skyscraper_vertical'}]
                    [{* Review Sticker Standard Modus Bewertungssticker Sidebar Start *}]
                    [{assign var="sVariant" value="skyscraper_vertical"}]
                    [{assign var="iReviews" value=3}]
                    [{* Review Sticker Standard Modus Bewertungssticker Sidebar Ende *}]
                [{elseif $oTSID->review_sticker == 1}]
                    [{* Review Sticker Standard Modus Kommentarsticker Start *}]
                    [{assign var="sVariant" value="testimonial"}]
                    [{assign var="iReviews" value=$oTSID->note_sticker_reviews_amount}]
                    [{assign var="sBetterThan" value=$oTSID->note_sticker_min_rating}]
                    [{assign var="sBGColor" value=$oTSID->note_sticker_bg}]
                    [{assign var="sFont" value=$oTSID->note_sticker_font}]
                    [{* Review Sticker Standard Modus Kommentarsticker Ende *}]
                [{/if}]
                <div class="sidebar_box[{if $oTSID->review_sticker == 1}] dd-ts-review_sticker-footer[{/if}]" [{if $oTSID->review_sticker == 1}] style="height: 100%; width: 100%; overflow: hidden; padding: 15px 0 0 0;"[{/if}]>
                    <div id="ts_reviewsticker">&nbsp;</div>
                    <script type="text/javascript">
                        [{capture assign="sReviewStickerStandardSidebar"}]
                        [{strip}]
                        function loadReviewSticker()
                        {
                            _tsRatingConfig = {
                                tsid:               '[{$oTSID->tsid}]',
                                variant:            '[{$sVariant}]',
                                reviews:            [{$iReviews}],
                                richSnippets:       'on',
                                linkColor:          '#333333',
                                quotationMarkColor: '#333333',
                                reviewMinLength:    '10',
                                fontColor:          '#333333',
                                [{if $sBetterThan}]
                                betterThan:         [{$sBetterThan}],
                                [{/if}]
                                [{if $sFont}]
                                fontFamily:         '[{$sFont}]',
                                [{/if}]
                                [{if $sBGColor}]
                                backgroundColor:    '[{$sBGColor}]',
                                [{/if}]
                            };
                            var div         = document.getElementById( 'ts_reviewsticker' );

                            var _ts     = document.createElement( 'SCRIPT' );
                            _ts.type    = 'text/javascript';
                            _ts.async   = true;
                            _ts.charset = 'utf-8';
                            _ts.src     = '//widgets.trustedshops.com/reviews/tsSticker/tsSticker.js';
                            div.parentNode.insertBefore( _ts, div );
                            _tsRatingConfig.script = _ts;
                        }

                        $( window ).load( function () {
                            loadReviewSticker();
                        } );
                        [{/strip}]
                        [{/capture}]
                    </script>

                    [{oxscript add=$sReviewStickerStandardSidebar}]
                </div>
                [{* Review Sticker Standard Modus Kommentar Sticker oder Bewertungssticker Sidebar Ende *}]
            [{/if}]
            [{* Review Sticker Standard Modus Bewertungssticker Ende *}]
        [{/if}]
        [{* Review Sticker Ende *}]
    [{elseif $sFeature == 'product_sticker'}]
        [{* Produkt Sticker Start *}]
        <div class="dd-ts-reviews">
            [{assign var="sCustomProductStickerCode" value=$oTSID->product_sticker_code|trim}]
            [{assign var="sSKU" value="'"|cat:$oArticle->oxarticles__oxartnum->value|cat:"'"}]
            [{assign var="oParentArticle" value=$oArticle->getParentArticle()}]

            [{if !$oParentArticle}]
                [{assign var="oParentArticle" value=$oArticle}]
            [{/if}]

            [{assign var="oVariants" value=$oParentArticle->getSimpleVariants()}]

            [{if $oVariants}]
                [{capture assign="sSKU"}]
                    [{strip}]
                        [
                        '[{$oArticle->oxarticles__oxartnum->value}]',
                        [{foreach from=$oVariants key="sVarKey" item="oVar" name="ts_simple_variants"}]
                            '[{$oVar->oxarticles__oxartnum->value}]'[{if !$smarty.foreach.ts_simple_variants.last}],[{/if}]
                        [{/foreach}]
                        ]
                    [{/strip}]
                [{/capture}]
            [{/if}]

            <div id="dd-productsticker">

                <div id="productStickerTitle" class="boxwrapper">
                    <div class="page-header">
                        <h2>
                            [{if $oTSID->savedTab == 'expert' && $oTSID->collect_product_reviews_details_tab_expert}]
                                [{* Produkt Sticker Expertenmodus und Produktbewertungen sammeln Start *}]
                                [{$oTSID->collect_product_reviews_details_tab_name_expert}]
                                [{* Produkt Sticker Expertenmodus und Produktbewertungen sammeln Start *}]
                            [{elseif $oTSID->savedTab == 'standard' && $oTSID->collect_product_reviews_details_tab}]
                                [{* Produkt Sticker Standardmodus und Produktbewertungen in einem zus�tzlichen Abschnitt anzeigen Start *}]
                                [{$oTSID->collect_product_reviews_details_tab_name}]
                                [{* Produkt Sticker Standardmodus und Produktbewertungen in einem zus�tzlichen Abschnitt anzeigen Ende *}]
                            [{/if}]
                        </h2>
                    </div>
                </div>

                <div id="ddproductreviewscontent"></div>

                [{if $oTSID->collect_product_reviews_expert && $oTSID->collect_product_reviews_details_tab_expert && $sCustomProductStickerCode && $oTSID->savedTab == 'expert'}]
                    [{* Produkt Sticker Expertenmodus Start *}]
                    [{assign var="sElement" value="#review"}]
                    [{if $oTSID->collect_product_reviews_details_tab_jquery_selector_expert != ''}]
                        [{assign var="sElement" value=$oTSID->collect_product_reviews_details_tab_jquery_selector_expert}]
                    [{/if}]
                    <div id="dd-productreviews">
                        <div id="dd-productreviews-content"></div>
                        <script id="dd_ts_productReviewsConfig">
                            [{capture assign="sProductStickerCodeExpert"}]
                            [{strip}]
                            function loadProductSticker()
                            {
                                if ( !document.getElementById( 'trustedshops-productreviews-sticker-wrapper' ) && window.isReviewWidgetVisible[{$sTimestamp}] === false )
                                {
                                    window.isReviewWidgetVisible[{$sTimestamp}] = true;
                                    [{$sCustomProductStickerCode|replace:"'%sku%'":$sSKU|replace:"%locale%":$sLocale|replace:"%element%":"#dd-productreviews-content"}]
                                }
                            }

                            loadProductSticker();
                            [{/strip}]
                            [{/capture}]
                        </script>

                        [{oxscript add=$sProductStickerCodeExpert}]
                    </div>
                    <script>
                        [{capture assign="tsScript"}]
                        $( window ).load( function () {
                                              $( "#dd-productsticker script" ).remove();
                                              $( "#dd-productsticker" ).appendTo( '[{$sElement}]' );
                                          }
                        );
                        [{/capture}]
                    </script>
                    [{oxscript add=$tsScript}]
                    [{* Produkt Sticker Expertenmodus Ende *}]
                [{elseif $oTSID->collect_product_reviews && $oTSID->collect_product_reviews_details_tab && $oTSID->savedTab == 'standard'}]
                    [{* Produkt Sticker Standardmodus Start *}]
                    <script type="text/javascript" id="dd_ts_productReviewsConfig">
                        [{capture assign="sProductReviewsStandard"}]
                        [{strip}]
                        if ( !document.getElementById( 'trustedshops-productreviews-sticker-wrapper' ) && window.isReviewWidgetVisible[{$sTimestamp}] === false )
                        {
                            window.isReviewWidgetVisible[{$sTimestamp}] = true;
                            _tsProductReviewsConfig                     = {
                                tsid:               '[{$oTSID->tsid}]',
                                sku:                 [{$sSKU}],
                                variant:            'productreviews',
                                /* optional */
                                borderColor:        '[{$oTSID->collect_product_reviews_details_tab_border}]',
                                backgroundColor:    '[{$oTSID->collect_product_reviews_details_tab_color_bg}]',
                                locale:             '[{$sLocale}]',
                                starColor:          '[{$oTSID->collect_product_reviews_details_tab_color_stars}]',
                                commentBorderColor: '#dad9d5',
                                commentHideArrow:   'false',
                                richSnippets:       'on',
                                starSize:           '[{$oTSID->collect_product_reviews_details_tab_size_stars}]',
                                ratingSummary:      'false',
                                maxHeight:          '1200px',
                                hideEmptySticker:   'false',
                                filter:             'true',
                                element:            '#ddproductreviewscontent',
                                introtext:          '[{oxmultilang ident="DD_TRUSTEDSHOPS_FEATURES_WIDGET_PRODUCT_STICKER_INTROTEXT"}]'
                            };

                            var me      = document.getElementById( 'ddproductreviewscontent' );
                            var _ts     = document.createElement( 'SCRIPT' );
                            _ts.type    = 'text/javascript';
                            _ts.async   = true;
                            _ts.charset = 'utf-8';
                            _ts.src     = '//widgets.trustedshops.com/reviews/tsSticker/tsProductSticker.js';

                            me.parentNode.insertBefore( _ts, me );
                            window._tsProductReviewsConfig.script = _ts;
                        }
                        [{/strip}]
                        [{/capture}]
                    </script>
                    [{oxscript add=$sProductReviewsStandard}]
                [{/if}]
                [{* Produkt Sticker Standardmodus Ende *}]
            </div>

            [{assign var="sElement" value="#tsItemRatings"}]
            [{assign var="product_sticker_tab_code" value=$oTSID->product_sticker_tab_code|trim}]

            <script type="text/javascript" src="//widgets.trustedshops.com/reviews/tsSticker/tsProductStickerSummary.js"></script>
            [{if $oTSID->collect_product_reviews_expert && $oTSID->collect_product_reviews_details_star_expert && $oTSID->savedTab == 'expert'}]
                [{* Produkt Sticker Expertenmodus Sterne-Bewertungen verschieben Start *}]
                <script type="text/javascript">
                    [{capture assign="sProductStickerTabCodeExpert"}]
                    [{strip}]
                    [{$product_sticker_tab_code|replace:"'%sku%'":$sSKU|replace:"%element%":$sElement}]
                    [{/strip}]
                    [{/capture}]
                </script>
                [{oxscript add=$sProductStickerTabCodeExpert}]

                <script type="text/javascript">
                    [{if $oTSID->collect_product_reviews_details_stars_jquery_selector_expert != ''}]
                    [{assign var="sElement" value=$oTSID->collect_product_reviews_details_stars_jquery_selector_expert}]
                    [{/if}]

                    [{capture assign="sMoveStars"}]
                    [{strip}]
                    $( "#tsItemRatings" ).appendTo( '[{$sElement}]' );
                    [{/strip}]
                    [{/capture}]
                </script>
                [{oxscript add=$sMoveStars}]
                [{* Produkt Sticker Expertenmodus Sterne-Bewertungen verschieben Ende *}]
            [{elseif $oTSID->savedTab == 'standard' && $oTSID->collect_product_reviews && $oTSID->collect_product_reviews_details_star}]
                [{* Produkt Sticker Standardmodus Sterne-Bewertungen ausgeben Start *}]
                <script>
                    [{capture assign="sSummaryBadge"}]
                    [{strip}]
                    var summaryBadge = new productStickerSummary();
                    summaryBadge.showSummary(
                        {
                            'tsId':              '[{$oTSID->tsid}]',
                            'sku':                [{$sSKU}],
                            'element':           '#tsItemRatings',
                            'starColor':         '[{$oTSID->collect_product_reviews_details_stars_color_stars}]',
                            'starSize':          '[{$oTSID->collect_product_reviews_details_stars_size}]',
                            'fontSize':          '[{$oTSID->collect_product_reviews_details_stars_font_size}]',
                            'showRating':        'true',
                            'scrollToReviews':   'false',
                            'enablePlaceholder': '[{$oTSID->collect_product_reviews_details_stars_hide_empty}]'
                        }
                    );
                    [{/strip}]
                    [{/capture}]
                </script>
                [{oxscript add=$sSummaryBadge}]
                [{* Produkt Sticker Standardmodus Sterne-Bewertungen ausgeben Start *}]
            [{/if}]
        </div>
        [{* Produkt Sticker Ende *}]
    [{elseif $sFeature == 'shop_ratings'}]
        [{* Shop Bewertungen Start *}]
        [{assign var="aTSRatings" value=$oViewConf->getTSCustomerRatings()}]
        [{assign var="sActiveClassName" value=$oViewConf->getTopActiveClassName()}]
        [{if $aTSRatings|@count}]
            [{if $oTSID->savedTab == 'standard'}]
                [{if $oTSID->rich_snippets && ( ( $oTSID->google_rich_snippets->home_page && $sActiveClassName == 'start' ) ||
                ( $oTSID->google_rich_snippets->category_pages && $sActiveClassName == 'alist' ) ||
                ( $oTSID->google_rich_snippets->details_pages  && $sActiveClassName == 'details' ) ) }]
                    <script type="application/ld+json">
                        {
                            "@context": "http://schema.org",
                            "@type": "Organization",
                            "name": "[{$aTSRatings.shopName}]",
                            "aggregateRating" :
                            {
                                "@type": "AggregateRating",
                                "ratingValue" : "[{$aTSRatings.result}]", "bestRating" : "[{$aTSRatings.max}]", "ratingCount" : "[{$aTSRatings.count}]"
                            }
                        }

                    </script>
                [{/if}]
            [{elseif $oTSID->savedTab == 'expert'}]
                [{assign var="sCustomRichSnippetsCode" value=$oTSID->rich_snippets_code|trim}]
                [{if $oTSID->rich_snippets_expert && ( ( $oTSID->google_rich_snippets_expert->home_page && $sActiveClassName == 'start' ) ||
                ( $oTSID->google_rich_snippets_expert->category_pages && $sActiveClassName == 'alist' ) ||
                ( $oTSID->google_rich_snippets_expert->details_pages  && $sActiveClassName == 'details' ) ) }]
                    [{$sCustomRichSnippetsCode|replace:"%ratingValue%":$aTSRatings.result|replace:"%bestRating%":$aTSRatings.max|replace:"%ratingCount%":$aTSRatings.count}]
                [{/if}]
            [{/if}]
        [{/if}]
        [{* Shop Bewertungen Ende *}]
    [{/if}]
[{/if}]