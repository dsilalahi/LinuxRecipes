import java.util.Properties;

import org.apache.oozie.client.OozieClient;
import org.apache.oozie.client.WorkflowJob;

public class myOozieWorkflowJavaAPICall {

    public static void main(String[] args) {

        String client_url = "http://url:11000/oozie";
        String namenode_base_url = "hdfs://namenode.hadoop.com:8020";
        String jobtracker_url = "job-tracker:8021";

        OozieClient wc = new OozieClient(client_url);

        Properties conf = wc.createConfiguration();

        conf.setProperty(OozieClient.APP_PATH, namenode_base_url + "/user/uid/oozieProject/javaApplication/workflow.xml");
        conf.setProperty("jobTracker", jobtracker_url);
        conf.setProperty("nameNode", namenode_base_url);
        conf.setProperty("queueName", "default");
        conf.setProperty("airawatOozieRoot", namenode_base_url + "/user/uid/oozieProject/javaApplication");
        conf.setProperty("oozie.libpath", namenode_base_url + "/user/oozie/share/lib");
        conf.setProperty("oozie.use.system.libpath", "true");
        conf.setProperty("oozie.wf.rerun.failnodes", "true");

        try {
            String jobId = wc.run(conf);
            System.out.println("Workflow job, " + jobId + " submitted");

            while (wc.getJobInfo(jobId).getStatus() == WorkflowJob.Status.RUNNING) {
                System.out.println("Workflow job running ...");
                Thread.sleep(10 * 1000);
            }
            System.out.println("Workflow job completed ...");
            System.out.println(wc.getJobInfo(jobId));
        } catch (Exception r) {
            System.out.println("Errors " + r.getLocalizedMessage());
        }
    }
}