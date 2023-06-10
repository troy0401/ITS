import pandas as pd
from pgmpy.inference import VariableElimination
from pgmpy.models import BayesianNetwork
from pgmpy.estimators import BayesianEstimator
import numpy as np
import sys

# Read the dataset from the CSV file
data = pd.read_csv('student_data2.csv')

# Define the Bayesian network structure
model = BayesianNetwork([('Attempts', 'Certainty'), ('Score', 'Certainty')])

# Create an instance of the LaplaceEstimator class
estimator = BayesianEstimator(model, data)

# Estimate the CPDs using Laplace smoothing
pseudo_counts_attempts = np.ones((10, 1))
cpd_attempts = estimator.estimate_cpd('Attempts', prior_type='dirichlet', pseudo_counts=pseudo_counts_attempts)

pseudo_counts_score = np.ones((2,1))
cpd_score = estimator.estimate_cpd('Score', prior_type='dirichlet', pseudo_counts=pseudo_counts_score)

pseudo_counts_certainty = np.ones((2, 20))
cpd_certainty = estimator.estimate_cpd('Certainty', prior_type='dirichlet', pseudo_counts=pseudo_counts_certainty)

# Add the CPDs to the model
model.add_cpds(cpd_attempts, cpd_score, cpd_certainty)

# Check if the model is correctly defined and valid
model.check_model()

# Create the variable elimination instance
infer = VariableElimination(model)

# Fetch the attempts and score from the PHP script via command-line arguments
attempts = int(sys.argv[1])
score = int(sys.argv[2])

evidence = {'Attempts': attempts, 'Score': score}

# Predict the state(s) of the 'Certainty' variable
predicted_states = infer.query(['Certainty'], evidence=evidence)

# Get the probability of 'Certainty' being in state 1 and multiply it by 100
certainty = predicted_states.values[1] * 100

print(certainty)
