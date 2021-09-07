/**
 *
 *     |o     o    |          |
 * ,---|.,---..,---|,---.,---.|__/
 * |   |||   |||   ||---'`---.|  \
 * `---'``---|``---'`---'`---'`   `
 *       `---'    [media solutions]
 *
 * @copyright   (c) digidesk - media solutions
 * @link        http://www.digidesk.de
 * @author      digidesk - media solutions
 * @version     Git: $Id$
 */

;( function( $, global )
    {
        //Minicolors initialisieren
        $( '.dd-colorpicker' ).each( function () {
            $( this ).minicolors(
                {
                    theme:    'bootstrap',
                    position: 'bottom right',
                    format:   'hex'
                } );
        } );

        var iSaveAlertTimeout = null;
        // AJAX-Submit für Formulare
        var submitAjaxForm = function( $oForm )
        {
            $.ajax(
                {
                    url:      "index.php",
                    method:   "POST",
                    data:     $oForm.serialize(),
                    dataType: "JSON",
                    success:  function ( oResponse ) {
                        global.clearTimeout( iSaveAlertTimeout );

                        if ( !oResponse || oResponse.error )
                        {
                            $( '#alert_error_save span' ).fadeIn().text( oResponse.error ).parent().addClass( 'open' );
                            iSaveAlertTimeout = window.setTimeout( function () {
                                $( '#alert_error_save' ).fadeOut().removeClass( 'open' );
                            }, 4000 );
                        }

                        if ( oResponse && oResponse.success )
                        {
                            $( '#alert_success_save' ).fadeIn().addClass( 'open' );
                            iSaveAlertTimeout = window.setTimeout( function () {
                                $( '#alert_success_save' ).fadeOut().removeClass( 'open' );
                            }, 4000 );
                        }
                    }
                }
            );
        };

        // Event beim Öffnen von AJAX-Modals
        $( '.modal[data-content-tpl]' ).on( 'show.bs.modal', function () {
                                               var $this = $( this );

            $this.find( '.modal-body' ).html( $( '.dd-modal-loading-content' ).clone() );

                                               $.ajax(
                                                   {
                                                       url:      "index.php",
                                                       method:   "GET",
                                                       data:
                                                                 {
                                                                     admin_sid: sAdminSid,
                                                                     stoken:    sAdminToken,
                                                                     shp:       sShopId,
                                                                     cl:        'dd_trustedshops_features',
                                                                     fnc:       'getAjaxTpl',
                                                                     tpl:       $this.data( 'content-tpl' ),
                                                                     id:        $this.data( 'content-id' )
                                                                 },
                                                       dataType: "html",
                                                       success:  function ( sResponse ) {
                                                           if ( sResponse )
                                                           {
                                                               $this.find( '.modal-content' ).html( sResponse );
                                                               $this.find( '.modal-content form.dd-form-ajax-submit' ).submit( function ( e ) {
                                                                   e.preventDefault();
                                                                   submitAjaxForm( $( this ) )
                                                               } );
                                                               $( '#dd-switch-id-help' ).tooltip( { 'placement': 'top', 'z-index': '3000' } );
                                                           }
                                                       }
                                                   }
                                               );
                                           }
        );

        // Modals öffnen, die schon beim Laden die Klasse "in" haben.
        $( '.modal.in' ).modal( 'show' );

        // Tooltips laden
        $( '.has-tooltip' ).tooltip();

        // TS-ID-Switcher
        $( '.dd-tsid-switcher ul.dropdown-menu a' ).click( function ( e ) {
                                                              var $this    = $( this ),
                                                                  $oTarget = $( e.target );

            if ( $this.hasClass( 'dd-add-button' ) )
                                                              {
                                                                  // Add action
                                                                  $( '' + $this.data( 'target' ) ).data( 'content-id', $this.data( 'content-id' ) ).modal( 'show' );
                                                              }
            else if ( e.target.nodeName == 'A' || (e.target.nodeName == 'SPAN' && $oTarget.hasClass( 'dd-title' )) )
                                                              {
                                                                  // Switch TS ID
                                                                  //global.location.href = top.location.href.replace( 'cl=admin_start', 'cl=dd_trustedshops_features&tsid=' + $this.data( 'content-id' ) );
                                                                  global.location.href = sSelfLink + 'cl=dd_trustedshops_features&tsid=' + $this.data( 'content-id' );
                                                              }
            else if ( $oTarget.hasClass( 'dd-delete-button' ) )
                                                              {
                                                                  // Delete action
                                                                  //global.location.href = top.location.href.replace( 'cl=admin_start', 'cl=dd_trustedshops_features&fnc=deleteTSID&id=&deleteId=' + $this.data( 'content-id' ) );
                                                                  global.location.href = sSelfLink + 'cl=dd_trustedshops_features&fnc=deleteTSID&id=&deleteId=' + $this.data( 'content-id' );
                                                              }
                                                              else
                                                              {
                                                                  // Edit action
                                                                  // $( '' + $this.data( 'target' ) ).data( 'content-id', $this.data( 'content-id' ) ).modal( 'show' );
                                                              }
                                                          }
        );

        // Bind AJAX Forms
        $( '.dd-form-ajax-submit' ).submit( function( e ) { e.preventDefault(); submitAjaxForm( $( this ) ) } );

        // TAB STANDARD START
        // Konfigurieren Sie Produktbewertungen * START *
        var $collectProductReviews              = $( '.collect-product-reviews' );
        var $collectProductReviewsModal         = $( '#dd-collect-product-reviews-modal' );
        var $collectProductReviewsTab           = $( '.collect-product-reviews-details-tab' );
        var $collectProductReviewsTabCheckbox   = $( '.collect-product-reviews-details-tab input[type=checkbox]' );
        var $collectProductReviewsStarCheckbox  = $( '.collect-product-reviews-details-star input[type=checkbox]' );
        var $collectProductReviewsStar          = $( '.collect-product-reviews-details-star' );
        var $collectProductReviewsTabAdvanced   = $( '.collect-product-reviews-details-tab-advanced' );
        var $collectProductReviewsStarsAdvanced = $( '.collect-product-reviews-details-star-advanced' );

        // Bei Aktivierung der Checkbox das Modal öffnen
        $collectProductReviews.change( function () {
            // Prüfung auf Checkbox
            if ( this.checked )
            {
                // Modal öffnen
                $collectProductReviewsModal.modal();
            }

            // Falls die Checkbox deaktiviert wird
            if ( !this.checked )
            {
                // Die Optionen wieder ausblenden
                $collectProductReviewsTab.hide();
                $collectProductReviewsStar.hide();
                $collectProductReviewsTabAdvanced.hide();
                $collectProductReviewsStarsAdvanced.hide();
                $collectProductReviewsTabCheckbox.attr( 'checked', false );
                $collectProductReviewsStarCheckbox.attr( 'checked', false );
            }
        } );

        // Beim Schließen des Modals die weiteren Optionen einblenden.
        $collectProductReviewsModal.on( 'hidden.bs.modal', function () {
            // Optionen nach Schließung des Modals einblenden
            $collectProductReviewsTab.show();
            $collectProductReviewsStar.show();

            if ( $( '.collect-product-reviews-details-tab input[type=checkbox]' ).is( ':checked' ) )
            {
                $collectProductReviewsTabAdvanced.show();
            }

            if ( $( '.collect-product-reviews-details-star input[type=checkbox]' ).is( ':checked' ) )
            {
                $collectProductReviewsStarsAdvanced.show();
            }
        } );

        // Wenn Produktbewertungen sammeln gesetzt, dann die 2 weiteren Optionen anzeigen
        if ( $collectProductReviews.is( ':checked' ) )
        {
            // Beim Aufruf des Views und gesetzter Checkbox die 2 Optionen einblenden
            $collectProductReviewsTab.show();
            $collectProductReviewsStar.show();
        }

        $collectProductReviewsTabCheckbox.change( function () {
            // Die Optionen Ein- und Ausblenden
            if ( this.checked )
            {
                $collectProductReviewsTabAdvanced.show();
            }

            if ( !this.checked )
            {
                $collectProductReviewsTabAdvanced.hide();
            }
        } );

        // Wenn Produktbewertungen auf der Produktdetailseite in einem zusätzlichen Reiter anzeigen gesetzt, dann die Unteroptionen anzeigen
        if ( $collectProductReviewsTabCheckbox.is( ':checked' ) )
        {
            // Beim Aufruf des Views und gesetzter Checkbox die Unteroptionen einblenden
            $collectProductReviewsTabAdvanced.show();
        }

        $collectProductReviewsStarCheckbox.change( function () {
            // Die Optionen Ein- und Ausblenden
            if ( this.checked )
            {
                $collectProductReviewsStarsAdvanced.show();
            }

            if ( !this.checked )
            {
                $collectProductReviewsStarsAdvanced.hide();
            }
        } );

        // Wenn Produktbewertungen auf der Produktdetailseite in einem zusätzlichen Reiter anzeigen gesetzt, dann die Unteroptionen anzeigen
        if ( $collectProductReviewsStarCheckbox.is( ':checked' ) )
        {
            // Beim Aufruf des Views und gesetzter Checkbox die Unteroptionen einblenden
            $collectProductReviewsStarsAdvanced.show();
        }
        // Konfigurieren Sie Produktbewertungen * ENDE *

        // Konfigurieren Sie weitere Produkte -> Review Sticker aktivieren * START *
        var reviewSticker       = $( '#settings_standard_review_sticker' );
        var reviewStickerSelect = $( 'select[name="settings_standard[review_sticker]"]' );
        var reviewStickerPos    = $( '.settings_standard_review_sticker_position' );
        var noteStickerGroup    = $( '.settings_standard_note_sticker_group' );
        var richSnippet         = $( '#settings_standard_rich_snippets' );
        var richSnippetGroup    = $( '.settings_standard_rich_snippets_group' );
        reviewSticker.on( 'change', function () {
            if ( this.value === '2' )
            {
                // Optionen für Bewertungs-Sticker einblenden
                reviewStickerPos.show();
            }

            if ( this.value !== '2' )
            {
                // Optionen für Bewertungs-Sticker ausblenden
                reviewStickerPos.hide();
            }

            if ( this.value === '1' )
            {
                // Optionen für Kommentar-Sticker einblenden
                noteStickerGroup.show();
            }

            if ( this.value !== '1' )
            {
                // Optionen für Kommentar-Sticker ausblenden
                noteStickerGroup.hide();
            }
        } );

        // Wenn Review Sticker aktivieren = Bewertungs-Sticker
        if ( reviewStickerSelect.val() === '2' )
        {
            reviewStickerPos.show();
        }

        // Wenn Review Sticker aktivieren = Kommentar-Sticker
        if ( reviewStickerSelect.val() === '1' )
        {
            noteStickerGroup.show();
        }

        richSnippet.on( 'change', function () {
            if ( this.value === '1' )
            {
                // Optionen für Rich Snippets einblenden
                richSnippetGroup.show();
            }

            if ( this.value !== '1' )
            {
                // Optionen für Rich-Snippets ausblenden
                richSnippetGroup.hide();
            }
        } );

        // Wenn Rich Snippets = Aktivieren
        if ( richSnippet.val() === '1' )
        {
            richSnippetGroup.show();
        }
        // Konfigurieren Sie weitere Produkte -> Review Sticker aktivieren * ENDE *
        // TAB STANDARD ENDE

        // TAB EXPERTE START
        // Konfigurieren Sie Produktbewertungen * START *
        var $collectProductReviewsEx              = $( '.collect-product-reviews-expert' );
        var $collectProductReviewsExModal         = $( '#dd-collect-product-reviews-expert-modal' );
        var $collectProductReviewsTabEx           = $( '.collect-product-reviews-details-tab-expert' );
        var $collectProductReviewsTabCheckboxEx   = $( '.collect-product-reviews-details-tab-expert input[type=checkbox]' );
        var $collectProductReviewsStarCheckboxEx  = $( '.collect-product-reviews-details-star-expert input[type=checkbox]' );
        var $collectProductReviewsStarEx          = $( '.collect-product-reviews-details-star-expert' );
        var $collectProductReviewsTabAdvancedEx   = $( '.collect-product-reviews-details-tab-advanced-expert' );
        var $collectProductReviewsStarsAdvancedEx = $( '.collect-product-reviews-details-star-advanced-expert' );

        // Bei Aktivierung der Checkbox das Modal öffnen
        $collectProductReviewsEx.change( function () {
            // Prüfung auf Checkbox
            if ( this.checked )
            {
                // Modal öffnen
                $collectProductReviewsExModal.modal();
            }

            // Falls die Checkbox deaktiviert wird
            if ( !this.checked )
            {
                // Die Optionen wieder ausblenden
                $collectProductReviewsTabEx.hide();
                $collectProductReviewsStarEx.hide();
                $collectProductReviewsTabAdvancedEx.hide();
                $collectProductReviewsStarsAdvancedEx.hide();
                $collectProductReviewsTabCheckboxEx.attr( 'checked', false );
                $collectProductReviewsStarCheckboxEx.attr( 'checked', false );
            }
        } );

        // Beim Schließen des Modals die weiteren Optionen einblenden.
        $collectProductReviewsExModal.on( 'hidden.bs.modal', function () {
            // Optionen nach Schließung des Modals einblenden
            $collectProductReviewsTabEx.show();
            $collectProductReviewsStarEx.show();

            if ( $( '.collect-product-reviews-details-tab-expert input[type=checkbox]' ).is( ':checked' ) )
            {
                $collectProductReviewsTabAdvancedEx.show();
            }

            if ( $( '.collect-product-reviews-details-star-expert input[type=checkbox]' ).is( ':checked' ) )
            {
                $collectProductReviewsStarsAdvancedEx.show();
            }
        } );

        // Wenn Produktbewertungen sammeln gesetzt, dann die 2 weiteren Optionen anzeigen
        if ( $collectProductReviewsEx.is( ':checked' ) )
        {
            // Beim Aufruf des Views und gesetzter Checkbox die 2 Optionen einblenden
            $collectProductReviewsTabEx.show();
            $collectProductReviewsStarEx.show();
        }

        $collectProductReviewsTabCheckboxEx.change( function () {
            // Die Optionen Ein- und Ausblenden
            if ( this.checked )
            {
                // Die Optionen einblenden
                $collectProductReviewsTabAdvancedEx.show();
            }

            if ( !this.checked )
            {
                // Die Optionen wieder ausblenden
                $collectProductReviewsTabAdvancedEx.hide();
            }
        } );

        // Wenn Produktbewertungen auf der Produktdetailseite in einem zusätzlichen Reiter anzeigen gesetzt, dann die Unteroptionen anzeigen
        if ( $collectProductReviewsTabCheckboxEx.is( ':checked' ) )
        {
            // Beim Aufruf des Views und gesetzter Checkbox die Unteroptionen einblenden
            $collectProductReviewsTabAdvancedEx.show();
        }

        $collectProductReviewsStarCheckboxEx.change( function () {
            // Die Optionen Ein- und Ausblenden
            if ( this.checked )
            {
                // Die Optionen einblenden
                $collectProductReviewsStarsAdvancedEx.show();
            }

            if ( !this.checked )
            {
                // Die Optionen wieder ausblenden
                $collectProductReviewsStarsAdvancedEx.hide();
            }
        } );

        // Wenn Produktbewertungen auf der Produktdetailseite in einem zusätzlichen Reiter anzeigen gesetzt, dann die Unteroptionen anzeigen
        if ( $collectProductReviewsStarCheckboxEx.is( ':checked' ) )
        {
            // Beim Aufruf des Views und gesetzter Checkbox die Unteroptionen einblenden
            $collectProductReviewsStarsAdvancedEx.show();
        }
        // Konfigurieren Sie Produktbewertungen * ENDE *
        // Konfigurieren Sie weitere Optionen * START *
        var richSnippetExpert        = $( '#settings_expert_rich_snippets' );
        var richSnippetGroupExpert   = $( '.settings_expert_rich_snippets_group' );
        var reviewStickerExpert      = $( '#settings_expert_review_sticker' );
        var reviewStickerExpertGroup = $( '.settings_expert_review_group' );
        var reviewStickerReviewCode  = $( '.dd-ts-review-code' );
        var reviewStickerCommentCode = $( '.dd-ts-comment-code' );

        richSnippetExpert.on( 'change', function () {
            if ( this.value === '1' )
            {
                // Optionen für Rich-Snippets einblenden
                richSnippetGroupExpert.show();
            }

            if ( this.value !== '1' )
            {
                // Optionen für Rich-Snippets ausblenden
                richSnippetGroupExpert.hide();
            }
        } );

        // Wenn Rich Snippets = Aktivieren
        if ( richSnippetExpert.val() === '1' )
        {
            richSnippetGroupExpert.show();
        }

        if ( reviewStickerExpert.val() === '1' || reviewStickerExpert.val() === '2' )
        {
            reviewStickerExpertGroup.show();

            if ( reviewStickerExpert.val() === '1' )
            {
                reviewStickerCommentCode.show();
            }

            if ( reviewStickerExpert.val() === '2' )
            {
                reviewStickerReviewCode.show();
            }
        }

        reviewStickerExpert.on( 'change', function () {
            if ( this.value === '1' || this.value === '2' )
            {
                // Optionen für Rich-Snippets einblenden
                reviewStickerExpertGroup.show();
                if ( this.value === '1' )
                {
                    reviewStickerReviewCode.hide();
                    reviewStickerCommentCode.show();
                }

                if ( this.value === '2' )
                {
                    reviewStickerCommentCode.hide();
                    reviewStickerReviewCode.show();
                }
            }

            if ( this.value === '0' )
            {
                // Optionen für Rich-Snippets ausblenden
                reviewStickerReviewCode.hide();
                reviewStickerCommentCode.hide();
                reviewStickerExpertGroup.hide();
            }
        } );

        // Wenn Rich Snippets = Aktivieren
        if ( reviewStickerExpert.val() === '1' || reviewStickerExpert.val() === '2' )
        {
            reviewStickerExpertGroup.show();
        }
        // Konfigurieren Sie weitere Optionen * ENDE *
        // TAB EXPERTE ENDE

    }
)( jQuery, window );