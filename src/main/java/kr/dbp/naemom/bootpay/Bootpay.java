package kr.dbp.naemom.bootpay;


import java.util.HashMap;

import org.springframework.stereotype.Controller;

import kr.dbp.naemom.bootpay.request.Cancel;
import kr.dbp.naemom.bootpay.request.Payload;
import kr.dbp.naemom.bootpay.request.Subscribe;
import kr.dbp.naemom.bootpay.request.SubscribePayload;
import kr.dbp.naemom.bootpay.request.UserToken;
import kr.dbp.naemom.bootpay.response.ResDefault;
import kr.dbp.naemom.bootpay.service.BillingService;
import kr.dbp.naemom.bootpay.service.CancelService;
import kr.dbp.naemom.bootpay.service.EasyService;
import kr.dbp.naemom.bootpay.service.LinkService;
import kr.dbp.naemom.bootpay.service.SubmitService;
import kr.dbp.naemom.bootpay.service.TokenService;
import kr.dbp.naemom.bootpay.service.VerificationService;


public class Bootpay extends BootpayObject {
    public Bootpay() { }

    public Bootpay(String rest_application_id, String private_key) {
        super(rest_application_id, private_key);
    }

    public Bootpay(String rest_application_id, String private_key, String devMode) {
        super(rest_application_id, private_key, devMode);
    }

    //token
    public ResDefault<HashMap<String, Object>> getAccessToken() throws Exception {
        return TokenService.getAccessToken(this);
    }

    //billing
    public ResDefault<HashMap<String, Object>> getBillingKey(Subscribe subscribeBilling) throws Exception {
        return BillingService.getBillingKey(this, subscribeBilling);
    }
    public ResDefault<HashMap<String, Object>> requestSubscribe(SubscribePayload payload) throws Exception {
        return BillingService.requestSubscribe(this, payload);
    }
    public ResDefault<HashMap<String, Object>> reserveSubscribe(SubscribePayload payload) throws Exception {
        return BillingService.reserveSubscribe(this, payload);
    }
    public ResDefault<HashMap<String, Object>> reserveCancelSubscribe(String reserve_id) throws Exception {
        return BillingService.reserveCancelSubscribe(this, reserve_id);
    }
    public ResDefault<HashMap<String, Object>> destroyBillingKey(String billing_key) throws Exception {
        return BillingService.destroyBillingKey(this, billing_key);
    }

    //cancel
    public ResDefault<HashMap<String, Object>> receiptCancel(Cancel cancel) throws Exception {
        return CancelService.receiptCancel(this, cancel);
    }

    //easy
    public ResDefault<HashMap<String, Object>> getUserToken(UserToken userToken) throws Exception {
        return EasyService.getUserToken(this, userToken);
    }

    //link
    public ResDefault<String> requestLink(Payload payload) throws Exception {
        return LinkService.requestLink(this, payload);
    }

    //submit
    public ResDefault<HashMap<String, Object>> submit(String receiptId) throws Exception {
        return SubmitService.submit(this, receiptId);
    }

    //veriy
    public ResDefault<HashMap<String, Object>> verify(String receiptId) throws Exception {
        return VerificationService.verify(this, receiptId);
    }
    public ResDefault<HashMap<String, Object>> certificate(String receiptId) throws Exception {
        return VerificationService.certificate(this, receiptId);
    }
}
