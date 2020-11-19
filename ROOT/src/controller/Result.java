package controller;
public class Result{
	String message;
	public String getMessage() {
		return message;
	}
	public boolean isResult() {
		return result;
	}
	boolean result;
	public Result(String message,boolean result){
		this.message = message;
		this.result = result;
	}
}
