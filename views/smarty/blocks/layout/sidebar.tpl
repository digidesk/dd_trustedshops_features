[{$smarty.block.parent}]
[{include file="widget/dd_trustedshops_features_widget.tpl" sFeature="rating_widget"}]

[{assign var="oTSID" value=$oViewConf->getTSIDObj()}]

[{if ( $oTSID->savedTab == 'standard' && $oTSID->review_sticker == 2 && $oTSID->review_sticker_position == "skyscraper_vertical" ) || ( $oTSID->savedTab == 'expert' && $oTSID->review_sticker == 2 && $oTSID->review_sticker_position ==
"skyscraper_vertical" ) }]
    [{include file="widget/dd_trustedshops_features_widget.tpl" sFeature="review_sticker" sPlacement='sidebar'}]
[{/if}]
