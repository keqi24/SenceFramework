public interface BaseStrategy {
 
	private SenceController senceController;
	 
	private BehaviorTree behaviorTree;
	 
	private BehaviorTreeNode behaviorTreeNode;
	 
	public abstract BaseDecision predict();
	public abstract void train();
}
 
