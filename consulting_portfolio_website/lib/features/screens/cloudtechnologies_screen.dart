import 'package:flutter/material.dart';

class CloudTechnologiesScreen extends StatelessWidget {
  static const String routeName = "/cloudtechnologies";
  const CloudTechnologiesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text("Cloud Technologies",style:TextStyle(
            fontSize: 120,
            fontStyle: FontStyle.italic,
            color:Colors.black
          ),
          textAlign: TextAlign.center,),
          Text("Amazon Web Services", style:TextStyle(
            fontSize: 40,
            color:Colors.black,
          ),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(child: Text("Amazon Web Services, Inc. (AWS) is a subsidiary of Amazon that provides on-demand cloud computing platforms and APIs to individuals, companies, and governments, on a metered pay-as-you-go basis. These cloud computing web services provide distributed computing processing capacity and software tools via AWS server farms. One of these services is Amazon Elastic Compute Cloud (EC2), which allows users to have at their disposal a virtual cluster of computers, available all the time, through the Internet. AWS's virtual computers emulate most of the attributes of a real computer, including hardware central processing units (CPUs) and graphics processing units (GPUs) for processing; local/RAM memory; hard-disk/SSD storage; a choice of operating systems; networking; and pre-loaded application software such as web servers, databases, and customer relationship management (CRM)",)),
          ),
          const SizedBox(
            height: 10,
          ),
          Text("Azure Cloud", style:TextStyle(
            fontSize: 40,
            color:Colors.black,
          ),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(child: Text("Azure is a cloud platform designed to simplify the process of building modern applications. Whether you choose to host your applications entirely in Azure or extend your on-premises applications with Azure services, Azure helps you create applications that are scalable, reliable, and maintainable.Azure supports the most popular programming languages in use today, including Python, JavaScript, Java, .NET and Go. With a comprehensive SDK library and extensive support in tools you already use like VS Code, Visual Studio, IntelliJ, and Eclipse, Azure is designed to take advantage of skills you already have and make you productive right away.",)),
          ),
          const SizedBox(
            height: 10,
          ),
          Text("Terraform", style:TextStyle(
            fontSize: 40,
            color:Colors.black,
          ),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(child: Text("Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently. Terraform can manage popular service providers as well as custom in-house solutions. It is used to define and provision the complete infrastructure using declarative language called the HashiCorp Configuration Language (HCL).",)),
          )
        ],
      ),
    ));
  }
}
