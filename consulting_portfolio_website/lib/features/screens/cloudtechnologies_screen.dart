import 'package:flutter/material.dart';

class CloudTechnologiesScreen extends StatelessWidget {
  static const String routeName = "/cloudtechnologies";
  const CloudTechnologiesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Cloud Technologies",
              style: TextStyle(
                  fontSize: 100,
                  fontStyle: FontStyle.italic,
                  color: Colors.black),
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Amazon Web Services (AWS)",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    color: Colors.deepPurple[900],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  width: 15.0,
                ),
                // Add AWS ICON
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.red[300],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                color: Colors.blue[100],
                elevation: 15,
                shadowColor: Colors.blue[900],
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Center(
                    child: Text(
                      "Amazon Web Services (AWS) provides on-demand cloud computing platforms and APIs to individuals, companies, and governments, on a pay-as-you-go basis. We can help you setup cloud computing web services that provide distributed computing processing capacity and software tools on AWS. One of these services we specialize in is called Amazon Elastic Compute Cloud (EC2), which provides users a virtual cluster of computers, available all the time, through the Internet. We can set up an EC2 service offering a choice of operating systems, networking, and pre-loaded application software such as web servers and databases. We will configure your application to run on AWS using these technologies",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.25,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Azure Cloud",
              style: TextStyle(
                fontSize: 40,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  "Azure is a cloud platform designed to simplify the process of building modern applications. Whether you choose to host your applications entirely in Azure or extend your on-premises applications with Azure services, Azure helps you create applications that are scalable, reliable, and maintainable.Azure supports the most popular programming languages in use today, including Python, JavaScript, Java, .NET and Go. With a comprehensive SDK library and extensive support in tools you already use like VS Code, Visual Studio, IntelliJ, and Eclipse, Azure is designed to take advantage of skills you already have and make you productive right away.",
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Terraform",
              style: TextStyle(
                fontSize: 40,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  "Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently. Terraform can be used on many types of cloud providers to manage services and infrastructure. Terraform uses a declarative language called the HashiCorp Configuration Language (HCL). We will create your infrastructure as code using Terraform in order to help manage your servers and cloud services",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
