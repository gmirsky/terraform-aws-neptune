from diagrams import Diagram, Cluster, Edge

from diagrams.aws.compute import EC2
from diagrams.aws.storage import S3
from diagrams.aws.database import Neptune
from diagrams.onprem.client import Client
from diagrams.aws.management import Cloudwatch

graph_attr = {
    "fontsize": "30"
}

with Diagram("Neptune Database / AWS US-East-1 ",
             filename="diagram",
             show=False,
             graph_attr=graph_attr):

    with Cluster("AWS"):
        rdf4jWorkbench = EC2("rdf4j-workbench")
        s3Bucket = S3("data load bucket")
        cloudWatch = Cloudwatch("CloudWatch")

        with Cluster("Neptune"):
            neptuneDb = Neptune("cluster")
            neptuneDb - [Neptune("Writer"), Neptune("Reader")]

    rdf4jWorkbench >> neptuneDb
    rdf4jWorkbench << neptuneDb
    cloudWatch << neptuneDb
    s3Bucket >> neptuneDb

    Client("web ui") >> Edge(color="darkblue",
                             style="dotted") << rdf4jWorkbench >> Edge()
