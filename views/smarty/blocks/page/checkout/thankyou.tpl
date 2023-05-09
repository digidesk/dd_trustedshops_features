[{$smarty.block.parent}]

[{assign var="oTSID" value=$oViewConf->getTSIDObj()}]

[{if $oTSID}]
    [{assign var="oOrder" value=$oView->getOrder()}]

    [{if $oOrder}]
        <div id="trustedShopsCheckout" style="display: none;">
            <span id="tsCheckoutOrderNr">[{$oOrder->oxorder__oxordernr->value}]</span>
            <span id="tsCheckoutBuyerEmail">[{$oOrder->oxorder__oxbillemail->value}]</span>
            <span id="tsCheckoutOrderAmount">[{$oOrder->oxorder__oxtotalordersum->value}]</span>
            <span id="tsCheckoutOrderCurrency">[{$oOrder->oxorder__oxcurrency->value}]</span>
            <span id="tsCheckoutOrderPaymentType">[{$oOrder->oxorder__oxpaymenttype->value}]</span>
            <span id="tsCheckoutOrderEstDeliveryDate">[{$oView->getEstimatedDeliveryDate()}]</span>

            [{if ( ( $oTSID->savedTab == 'standard' && $oTSID->collect_product_reviews == '1' ) ||
            ( $oTSID->savedTab == 'expert' && $oTSID->collect_product_reviews_expert == '1' ) )}]
                <!-- product reviews start -->
                [{foreach from=$oOrder->getOrderArticles() item="oOrderArticle"}]
                    [{assign var="oArticle"      value=$oOrderArticle->getArticle()}]
                    [{assign var="oManufacturer" value=$oArticle->getManufacturer()}]
                    [{assign var="sArticleName"  value=$oOrderArticle->oxorderarticles__oxtitle->value|cat:' '|cat:$oOrderArticle->oxorderarticles__oxselvariant->value}]
                    <span class="tsCheckoutProductItem">
                    <span class="tsCheckoutProductUrl">[{$oArticle->getLink()}]</span>
                    <span class="tsCheckoutProductImageUrl">[{$oArticle->getThumbnailUrl()}]</span>
                    <span class="tsCheckoutProductName">[{$sArticleName|trim}]</span>
                    <span class="tsCheckoutProductSKU">[{$oArticle->oxarticles__oxartnum->value}]</span>
                    <span class="tsCheckoutProductGTIN">[{$oArticle->oxarticles__oxean->value}]</span>
                    <span class="tsCheckoutProductMPN">[{$oArticle->oxarticles__oxmpn->value}]</span>
                    <span class="tsCheckoutProductBrand">[{if $oManufacturer}][{$oManufacturer->oxmanufacturers__oxtitle->value}][{/if}]</span>
                </span>
                [{/foreach}]
                <!-- product reviews end -->
            [{/if}]
        </div>
    [{/if}]
[{/if}]
