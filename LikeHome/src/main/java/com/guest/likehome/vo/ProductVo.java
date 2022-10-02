package com.guest.likehome.vo;

public class ProductVo {

	private int product_no;
	private int product_category2_no;
	private int vendor_no;
	private String product_name;
	private int product_price;
	private int product_quantity_onhand;
	private int product_delivery_fee;
	private String product_state;
	
	public ProductVo() {
		super();
	}

	public ProductVo(int product_no, int product_category2_no, int vendor_no, String product_name, int product_price,
			int product_quantity_onhand, int product_delivery_fee, String product_state) {
		super();
		this.product_no = product_no;
		this.product_category2_no = product_category2_no;
		this.vendor_no = vendor_no;
		this.product_name = product_name;
		this.product_price = product_price;
		this.product_quantity_onhand = product_quantity_onhand;
		this.product_delivery_fee = product_delivery_fee;
		this.product_state = product_state;
	}

	public int getProduct_no() {
		return product_no;
	}

	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}

	public int getProduct_category2_no() {
		return product_category2_no;
	}

	public void setProduct_category2_no(int product_category2_no) {
		this.product_category2_no = product_category2_no;
	}

	public int getVendor_no() {
		return vendor_no;
	}

	public void setVendor_no(int vendor_no) {
		this.vendor_no = vendor_no;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public int getProduct_price() {
		return product_price;
	}

	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}

	public int getProduct_quantity_onhand() {
		return product_quantity_onhand;
	}

	public void setProduct_quantity_onhand(int product_quantity_onhand) {
		this.product_quantity_onhand = product_quantity_onhand;
	}

	public int getProduct_delivery_fee() {
		return product_delivery_fee;
	}

	public void setProduct_delivery_fee(int product_delivery_fee) {
		this.product_delivery_fee = product_delivery_fee;
	}

	public String getProduct_state() {
		return product_state;
	}

	public void setProduct_state(String product_state) {
		this.product_state = product_state;
	}
	
	
	
	
}
