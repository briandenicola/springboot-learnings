
---

# Deploy Spring Boot apps using Azure Spring Apps and MySQL

This sample is an AZD template for a Spring Boot Pet Clinic application split into microservices running on Azure Spring Apps.

Let's jump in and get this up and running in Azure. When you are finished, you will have a fully functional Spring Petclinic application deployed to the cloud. In later steps, you'll see how to setup a pipeline and run the application.

![Spring Petclinic Application](media/petclinic.jpg)


### Quickstart

```bash
terraform -chdir=../../infrastructure init
terraform -chdir=../../infrastructure apply -auto-approve 
./mvnw -P spring-apps com.microsoft.azure:azure-spring-apps-maven-plugin:1.17.0:config
./mvnw azure-spring-apps:deploy
```

### Application Architecture

This application utilizes the following Azure resources:

- [**Azure Spring Apps**](https://docs.microsoft.com/azure/spring-apps/) to host the application

The Architecture diagram of the Spring Petclinic Microservices is shown as below:

![Spring Petclinic Microservices architecture](docs/microservices-architecture-diagram.jpg)



## Credits

This Spring microservices sample is forked from
[spring-petclinic/spring-petclinic-microservices](https://github.com/spring-petclinic/spring-petclinic-microservices) - see [Petclinic README](./README-petclinic.md).

## Contributing

This project welcomes contributions and suggestions. Most contributions require you to agree to a
Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant us
the rights to use your contribution. For details, visit https://cla.opensource.microsoft.com.

When you submit a pull request, a CLA bot will automatically determine whether you need to provide
a CLA and decorate the PR appropriately (e.g., status check, comment). Simply follow the instructions
provided by the bot. You will only need to do this once across all repos using our CLA.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or
contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.
