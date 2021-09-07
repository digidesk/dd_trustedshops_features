[{assign var="oTSID" value=$oViewConf->getTSIDObj()}]

<div class="rating clear">
    [{if ($oTSID->savedTab == 'standard' && $oTSID->collect_product_reviews == '1' && ($oTSID->collect_product_reviews_details_tab || $oTSID->collect_product_reviews_details_star)) ||
    ($oTSID->savedTab == 'expert' && $oTSID->collect_product_reviews_expert == '1' && ($oTSID->collect_product_reviews_details_tab_expert || $oTSID->collect_product_reviews_details_star_expert))}]
        <div id="tsItemRatings"></div>
    [{else}]
        [{$smarty.block.parent}]
    [{/if}]
</div>