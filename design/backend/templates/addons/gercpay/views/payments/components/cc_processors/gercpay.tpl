{include file="common/subheader.tpl" title=__("gercpay.settings.connection") target="#gercpay_connection"}
<div id="gercpay_connection">
  <div class="control-group">
    <label class="control-label cm-required" for="gercpay_merchantAccount">
        {__("gercpay.merchantAccount")}:</label>
    <div class="controls">
      <input type="text" name="payment_data[processor_params][merchantAccount]" id="gercpay_merchantAccount"
             value="{$processor_params.merchantAccount}" size="60">
    </div>
  </div>

  <div class="control-group">
    <label class="control-label cm-required" for="gercpay_merchantSecretKey">
        {__("gercpay.merchantSecretKey")}:</label>
    <div class="controls">
      <input type="text" name="payment_data[processor_params][merchantSecretKey]"
             id="gercpay_merchantSecretKey" value="{$processor_params.merchantSecretKey}" size="60">
    </div>
  </div>
</div>

{include file="common/subheader.tpl" title=__("gercpay.settings.transaction") target="#gercpay_transaction"}
<div id="gercpay_transaction">
  <div class="control-group">
    <label class="control-label cm-required" for="gercpay_currency">{__("gercpay.currency")}:</label>
    <div class="controls">
        {assign var="currencies" value=""|fn_gercpay_get_currencies}
      <select name="payment_data[processor_params][currency]" id="gercpay_currency">
          {foreach from=$currencies item="c" key="k"}
            <option value="{$k}"{if $processor_params.currency == $k} selected="selected"{/if}>{$c.description}</option>
          {/foreach}
      </select>
    </div>
  </div>
</div>

{include file="common/subheader.tpl" title=__("gercpay.settings.order_statuses") target="#gercpay_order_statuses"}
<div id="gercpay_order_statuses">
    {assign var="statuses" value=$smarty.const.STATUSES_ORDER|fn_get_simple_statuses}
  <div class="control-group">
    <label class="control-label" for="gercpay_order_Created">{__("gercpay.order_status.Created")}:</label>
    <div class="controls">
      <select name="payment_data[processor_params][order_status][Created]" id="gercpay_order_Created">
          {foreach from=$statuses item="s" key="k"}
            <option value="{$k}"{if $processor_params.order_status.Created == $k || !$processor_params.order_status.Created && $k == 'B'} selected="selected"{/if}>{$s}</option>
          {/foreach}
      </select>
      <p class="muted description">{__("ttc_gercpay.order_status.Created")}</p>
    </div>
  </div>

  <div class="control-group">
    <label class="control-label" for="gercpay_order_InProcessing">{__("gercpay.order_status.InProcessing")}
      :</label>
    <div class="controls">
      <select name="payment_data[processor_params][order_status][InProcessing]"
              id="gercpay_order_InProcessing">
          {foreach from=$statuses item="s" key="k"}
            <option value="{$k}"{if $processor_params.order_status.InProcessing == $k || !$processor_params.order_status.InProcessing && $k == 'O'} selected="selected"{/if}>{$s}</option>
          {/foreach}
      </select>
      <p class="muted description">{__("ttc_gercpay.order_status.InProcessing")}</p>
    </div>
  </div>

  <div class="control-group">
    <label class="control-label" for="gercpay_order_Approved">{__("gercpay.order_status.Approved")}:</label>
    <div class="controls">
      <select name="payment_data[processor_params][order_status][Approved]" id="gercpay_order_Approved">
          {foreach from=$statuses item="s" key="k"}
            <option value="{$k}"{if $processor_params.order_status.Approved == $k || !$processor_params.order_status.Approved && $k == 'P'} selected="selected"{/if}>{$s}</option>
          {/foreach}
      </select>
      <p class="muted description">{__("ttc_gercpay.order_status.Approved")}</p>
    </div>
  </div>

  <div class="control-group">
    <label class="control-label" for="gercpay_order_Pending">{__("gercpay.order_status.Pending")}:</label>
    <div class="controls">
      <select name="payment_data[processor_params][order_status][Pending]" id="gercpay_order_Pending">
          {foreach from=$statuses item="s" key="k"}
            <option value="{$k}"{if $processor_params.order_status.Pending == $k || !$processor_params.order_status.Pending && $k == 'O'} selected="selected"{/if}>{$s}</option>
          {/foreach}
      </select>
      <p class="muted description">{__("ttc_gercpay.order_status.Pending")}</p>
    </div>
  </div>

  <div class="control-group">
    <label class="control-label" for="gercpay_order_Expired">{__("gercpay.order_status.Expired")}:</label>
    <div class="controls">
      <select name="payment_data[processor_params][order_status][Expired]" id="gercpay_order_Expired">
          {foreach from=$statuses item="s" key="k"}
            <option value="{$k}"{if $processor_params.order_status.Expired == $k || !$processor_params.order_status.Expired && $k == 'F'} selected="selected"{/if}>{$s}</option>
          {/foreach}
      </select>
      <p class="muted description">{__("ttc_gercpay.order_status.Expired")}</p>
    </div>
  </div>

  <div class="control-group">
    <label class="control-label"
           for="gercpay_order_RefundedVoided">{__("gercpay.order_status.RefundedVoided")}:</label>
    <div class="controls">
      <select name="payment_data[processor_params][order_status][RefundedVoided]"
              id="gercpay_order_RefundedVoided">
          {foreach from=$statuses item="s" key="k"}
            <option value="{$k}"{if $processor_params.order_status.RefundedVoided == $k || !$processor_params.order_status.RefundedVoided && $k == 'E'} selected="selected"{/if}>{$s}</option>
          {/foreach}
      </select>
      <p class="muted description">{__("ttc_gercpay.order_status.RefundedVoided")}</p>
    </div>
  </div>

  <div class="control-group">
    <label class="control-label" for="gercpay_order_Declined">{__("gercpay.order_status.Declined")}:</label>
    <div class="controls">
      <select name="payment_data[processor_params][order_status][Declined]" id="gercpay_order_Declined">
          {foreach from=$statuses item="s" key="k"}
            <option value="{$k}"{if $processor_params.order_status.Declined == $k || !$processor_params.order_status.Declined && $k == 'D'} selected="selected"{/if}>{$s}</option>
          {/foreach}
      </select>
      <p class="muted description">{__("gercpay.order_status.Declined")}</p>
    </div>
  </div>

  <div class="control-group">
    <label class="control-label"
           for="gercpay_order_RefundInProcessing">{__("gercpay.order_status.RefundInProcessing")}:</label>
    <div class="controls">
      <select name="payment_data[processor_params][order_status][RefundInProcessing]"
              id="gercpay_order_RefundInProcessing">
          {foreach from=$statuses item="s" key="k"}
            <option value="{$k}"{if $processor_params.order_status.RefundInProcessing == $k || !$processor_params.order_status.RefundInProcessing && $k == 'E'} selected="selected"{/if}>{$s}</option>
          {/foreach}
      </select>
      <p class="muted description">{__("ttc_gercpay.order_status.RefundInProcessing")}</p>
    </div>
  </div>
</div>