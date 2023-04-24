package kr.dbp.naemom.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class PayDTO {
	private String receipt_id;
    private int price;
    private String order_name;
    private String order_id;
    private String pg;
    private String method;
    private int tax_free;
    private Extra extra;

    String itemState;
    String use_mile;
	String add_mile;
	String[] sb_num;
    
    
    
    public static class Extra {
        private String open_type;
        private String card_quota;
        private boolean escrow;
        private boolean display_success_result;
        private boolean display_error_result;
        private boolean separately_confirmed;

        public String getOpen_type() {
            return open_type;
        }

        public void setOpen_type(String open_type) {
            this.open_type = open_type;
        }

        public String getCard_quota() {
            return card_quota;
        }

        public void setCard_quota(String card_quota) {
            this.card_quota = card_quota;
        }

        public boolean isEscrow() {
            return escrow;
        }

        public void setEscrow(boolean escrow) {
            this.escrow = escrow;
        }

        public boolean isDisplay_success_result() {
            return display_success_result;
        }

        public void setDisplay_success_result(boolean display_success_result) {
            this.display_success_result = display_success_result;
        }

        public boolean isDisplay_error_result() {
            return display_error_result;
        }

        public void setDisplay_error_result(boolean display_error_result) {
            this.display_error_result = display_error_result;
        }

        public boolean isSeparately_confirmed() {
            return separately_confirmed;
        }

        public void setSeparately_confirmed(boolean separately_confirmed) {
            this.separately_confirmed = separately_confirmed;
        }
    }

}
