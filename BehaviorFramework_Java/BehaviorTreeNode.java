import java.util.List;

public class BehaviorTreeNode implements BaseStrategy {
 
	public String key;
	 
	public DecisionTree tree;
	 
	public List children;
	 
	private BaseStrategy baseStrategy;
	 
	private DecisionTree decisionTree;
	 
	private BehaviorTree behaviorTree;
	 
	/**
	 * @see BaseStrategy#predict()
	 */
	public BaseDecision predict() {
		return null;
	}
	 
	/**
	 * @see BaseStrategy#train()
	 */
	public void train() {
	 
	}
	 
}
 
