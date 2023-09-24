using System.Management.Automation;

namespace PSCmdletExample
{
    [Cmdlet("Invoke", "SayHello")]
    public class InvokeSayHelloCommand : PSCmdlet
    {
        [Parameter]
        public string BaseUrl { get; set; }

        protected override void EndProcessing()
        {
            var client = new BasicApi.Client.OperationsClient(this.BaseUrl);
            var result = client.SayHelloAsync().GetAwaiter().GetResult();
            this.WriteObject(result);
            base.EndProcessing();
        }
    }
}