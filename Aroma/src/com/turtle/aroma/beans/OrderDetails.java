package com.turtle.aroma.beans;

public class OrderDetails {

	private String[] item_name;
	private int[] item_quant;
	private double[] item_price;
	public String[] getItem_name() {
		return item_name;
	}
	public void setItem_name(String[] item_name) {
		this.item_name = item_name;
	}
	public int[] getItem_quant() {
		return item_quant;
	}
	public void setItem_quant(int[] item_quant) {
		this.item_quant = item_quant;
	}
	public double[] getItem_price() {
		return item_price;
	}
	public void setItem_price(double[] item_price) {
		this.item_price = item_price;
	}
	
}
