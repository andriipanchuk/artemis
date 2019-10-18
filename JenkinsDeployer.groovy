@Library('CommonLib@feature/kube-slave') _
def common = new com.lib.JenkinsCommonDeployPipeline()
common.runPipeline()
