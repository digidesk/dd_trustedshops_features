[{assign var="oTSID" value=$oViewConf->getTSIDObj()}]

[{if ( $oTSID->savedTab == 'standard' && $oTSID->review_sticker ) ||
     ( $oTSID->savedTab == 'expert' && $oTSID->review_sticker_expert ) }]
    [{include file="widget/dd_trustedshops_features_widget.tpl" sFeature="review_sticker" sPlacement="footer"}]
[{/if}]

[{$smarty.block.parent}]

[{include file="widget/dd_trustedshops_features_widget.tpl" sFeature="trustbadge"}]