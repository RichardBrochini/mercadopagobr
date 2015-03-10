{**
* 2007-2015 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Open Software License (OSL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/osl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author    ricardobrito
*  @copyright Copyright (c) MercadoPago [http://www.mercadopago.com]
*  @license   http://opensource.org/licenses/osl-3.0.php  Open Software License (OSL 3.0)
*  International Registered Trademark & Property of MercadoPago
*}

{if $creditcard_active == 'true' && $public_key != ''}
	<script type="text/javascript">
		if (window.Checkout === undefined) {
			$.getScript("https://secure.mlstatic.com/org-img/checkout/custom/1.0/checkout.js")
				.done(function( script, textStatus ) {
					Checkout.setPublishableKey("{$public_key|escape:'htmlall'}");
				});
		}
	</script>
{elseif $standard_active == 'true'}
	<script type="text/javascript">
		(function() {
		function $MPBR_load() {
			window.$MPBR_loaded !== true && (function() {
			var s = document.createElement("script");
			s.type = "text/javascript";
			s.async = true;
			s.src = ("https:"==document.location.protocol?"https://www.mercadopago.com/org-img/jsapi/mptools/buttons/":"http://mp-tools.mlstatic.com/buttons/")+"render.js";
			var x = document.getElementsByTagName('script')[0];
			x.parentNode.insertBefore(s, x);
			window.$MPBR_loaded = true;
			})();
		}

	window.$MPBR_loaded !== true ? 
		(window.attachEvent ? window.attachEvent('onload', $MPBR_load) : 
		 window.addEventListener('load', $MPBR_load, false)) : null;
		})();
	</script>
{/if}
