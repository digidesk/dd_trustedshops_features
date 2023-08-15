[{assign var="oTSID" value=$oViewConf->getTSIDObj()}]

[{if ( $oTSID->savedTab == 'standard' && $oTSID->review_sticker == 2 && $oTSID->review_sticker_position == "skyscraper_horizontal" ) ||
( $oTSID->savedTab == 'standard' && $oTSID->review_sticker == 1 ) || ( $oTSID->savedTab == 'expert' && $oTSID->review_sticker == 2 && $oTSID->review_sticker_position == "skyscraper_horizontal" ) ||
( $oTSID->savedTab == 'expert' && $oTSID->review_sticker == 1 ) }]
    [{include file="widget/dd_trustedshops_features_widget.tpl" sFeature="review_sticker" sPlacement="footer"}]
[{/if}]

[{$smarty.block.parent}]

[{include file="widget/dd_trustedshops_features_widget.tpl" sFeature="trustbadge"}]