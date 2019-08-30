@Library('CommonLib@master') _
def common = new com.lib.JenkinsDockerBuilder()
common.runPipeline()
