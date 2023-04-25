package kr.dbp.naemom.bootpay;


import org.apache.http.HttpResponse;

import kr.dbp.naemom.bootpay.request.Cancel;
import kr.dbp.naemom.bootpay.request.Payload;
import kr.dbp.naemom.bootpay.request.Subscribe;
import kr.dbp.naemom.bootpay.request.SubscribePayload;
import kr.dbp.naemom.bootpay.request.UserToken;
import kr.dbp.naemom.bootpay.service.BillingService;
import kr.dbp.naemom.bootpay.service.CancelService;
import kr.dbp.naemom.bootpay.service.EasyService;
import kr.dbp.naemom.bootpay.service.LinkService;
import kr.dbp.naemom.bootpay.service.SubmitService;
import kr.dbp.naemom.bootpay.service.VerificationService;


public class Bootpay extends BootpayObject {
	public Bootpay() { }

    public Bootpay(String rest_application_id, String private_key) {
        super(rest_application_id, private_key);
    }

    public Bootpay(String rest_application_id, String private_key, String devMode) {
        super(rest_application_id, private_key, devMode);
    }

    //billing
    public HttpResponse getBillingKey(Subscribe subscribeBilling) throws Exception {
        return BillingService.getBillingKey(this, subscribeBilling);
    }
    public HttpResponse requestSubscribe(SubscribePayload payload) throws Exception {
        return BillingService.requestSubscribe(this, payload);
    }
    public HttpResponse reserveSubscribe(SubscribePayload payload) throws Exception {
        return BillingService.reserveSubscribe(this, payload);
    }
    public HttpResponse reserveCancelSubscribe(String reserve_id) throws Exception {
        return BillingService.reserveCancelSubscribe(this, reserve_id);
    }
    public HttpResponse destroyBillingKey(String billing_key) throws Exception {
        return BillingService.destroyBillingKey(this, billing_key);
    }

    //cancel
    public HttpResponse receiptCancel(Cancel cancel) throws Exception {
        return CancelService.receiptCancel(this, cancel);
    }

    //easy
    public HttpResponse getUserToken(UserToken userToken) throws Exception {
        return EasyService.getUserToken(this, userToken);
    }

    //link
    public HttpResponse requestLink(Payload payload) throws Exception {
        return LinkService.requestLink(this, payload);
    }

    //submit
    public HttpResponse submit(String receiptId) throws Exception {
        return SubmitService.submit(this, receiptId);
    }

    //veriy
    public HttpResponse verify(String receiptId) throws Exception {
        return VerificationService.verify(this, receiptId);
    }
    public HttpResponse certificate(String receiptId) throws Exception {
        return VerificationService.certificate(this, receiptId);
    }
}
