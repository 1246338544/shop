package entity;

public class Result{
	private String message;
	public String getMessage() {
		return message;
	}
	public boolean isResult() {
		return result;
	}
	private boolean result;
	public Result(String message,boolean result){
		this.message = message;
		this.result = result;
	}
}