[{$smarty.block.parent}]

[{assign var="outputReviews" value=false}]

<script>
    [{assign var="sTimestamp" value="%H%M%S"|strftime}]
    if ( typeof window.isReviewWidgetVisible[{$sTimestamp}] === 'undefined' )
    {
        window.isReviewWidgetVisible[{$sTimestamp}] = false;
    }
</script>

[{assign var="oTSID" value=$oViewConf->getTSIDObj()}]

[{if ($oTSID->savedTab == 'standard' && $oTSID->collect_product_reviews == '1' && ($oTSID->collect_product_reviews_details_tab || $oTSID->collect_product_reviews_details_star)) ||
($oTSID->savedTab == 'expert' && $oTSID->collect_product_reviews_expert == '1' && ($oTSID->collect_product_reviews_details_tab_expert || $oTSID->collect_product_reviews_details_star_expert))}]
    [{include file="widget/dd_trustedshops_features_widget.tpl" sFeature="product_sticker" oArticle=$oView->getProduct()}]
[{/if}]
