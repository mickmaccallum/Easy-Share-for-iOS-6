//
//  UIViewController+easySharing.m
//  Easy Share for iOS 6
//
//  Created by Michael MacCallum on 11/25/12.
//
//  Accreditation is not required, but is always appreciated.
//
//  This Software is provided on an "AS IS" basis.  I
//  MAKE NO WARRANTIES, EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION
//  THE IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY AND FITNESS
//  FOR A PARTICULAR PURPOSE, REGARDING THE SOFTWARE OR ITS USE AND
//  OPERATION ALONE OR IN COMBINATION WITH YOUR PRODUCTS.
//
//  IN NO EVENT SHALL I BE LIABLE FOR ANY SPECIAL, INDIRECT, INCIDENTAL
//  OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
//  SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
//  INTERRUPTION) ARISING IN ANY WAY OUT OF THE USE, REPRODUCTION,
//  MODIFICATION AND/OR DISTRIBUTION OF THE SOFTWARE, HOWEVER CAUSED
//  AND WHETHER UNDER THEORY OF CONTRACT, TORT (INCLUDING NEGLIGENCE),
//  STRICT LIABILITY OR OTHERWISE, EVEN IF I HAVE BEEN ADVISED OF THE
//  POSSIBILITY OF SUCH DAMAGE.
//
//  That being said, you are free to use this code free of charge for absolutely
//  anything you want. You may use this in personal projects, commercial projects
//  or for anything else.

#import "UIViewController+easySharing.h"

@implementation UIViewController (easySharing)


- (void)easyShareServiceAgnosticWithInputObjects:(NSArray *)sharingObjects {
    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:sharingObjects applicationActivities:nil];
    [self presentViewController:activityController animated:YES completion:nil];
}

- (void)easyShareTextWithFacebook:(NSString *)text andImage:(UIImage *)image andURL:(NSURL *)url {
    [self slSharingWithID:SLServiceTypeFacebook andText:text andImage:image andURL:url];
}

- (void)easyShareTextWithTwitter:(NSString *)text andImage:(UIImage *)image andURL:(NSURL *)url {
    [self slSharingWithID:SLServiceTypeTwitter andText:text andImage:image andURL:url];
}

- (void)easyShareTextWithSinoWeibo:(NSString *)text andImage:(UIImage *)image andURL:(NSURL *)url {
    [self slSharingWithID:SLServiceTypeSinaWeibo andText:text andImage:image andURL:url];
}

- (void)easyShareBodyTextWithMail:(NSString *)bodyText andIsBodyHTML:(BOOL)isHTML andRecipients:(NSArray *)recipients andCcRecipients:(NSArray *)CcRecipients andBccRecipients:(NSArray *)BccRecipients andSubject:(NSString *)subject andAttachmentData:(NSData *)data attachmentDataMIMEtype:(NSString *)mime attechmentDataFileName:(NSString *)fileName {
    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController *mailViewController = [[MFMailComposeViewController alloc] init];
        mailViewController.mailComposeDelegate = self;
        if (bodyText)                   {[mailViewController setMessageBody:bodyText isHTML:isHTML];}
        if (recipients)                 {[mailViewController setToRecipients:recipients];}
        if (CcRecipients)               {[mailViewController setCcRecipients:CcRecipients];}
        if (BccRecipients)              {[mailViewController setBccRecipients:BccRecipients];}
        if (subject)                    {[mailViewController setSubject:subject];}
        if (data&&mime&&fileName)       {[mailViewController addAttachmentData:data mimeType:mime fileName:fileName];}

        [self presentViewController:mailViewController animated:YES completion:nil];
    }else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Your device is unable to send emails at this time." delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil];
        [alert show];
    }
}

- (void)easyShareTextWithTextMessage:(NSString *)text andRecipients:(NSArray *)recipients {
    if ([MFMessageComposeViewController canSendText]) {
        MFMessageComposeViewController *messageComposer = [[MFMessageComposeViewController alloc] init];
        [messageComposer setBody:text];
        [messageComposer setDelegate:self];
        [messageComposer setMessageComposeDelegate:self];
        [messageComposer setRecipients:recipients];
        [self presentViewController:messageComposer animated:YES completion:nil];
    }else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Your device is unable to send text messages at this time." delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil];
        [alert show];
    }
}

- (void)easyShareImageByPrinting:(UIImage *)image andData:(NSData *)data andFilePath:(NSString *)file andURL:(NSURL *)url {
    UIPrintInteractionController *printer = [UIPrintInteractionController sharedPrintController];
    [printer setPrintInfo:[UIPrintInfo printInfo]];
    [printer setPrintingItems:[NSArray arrayWithObjects:image,data,file,url, nil]];
    [printer setDelegate:self];
    [printer presentAnimated:YES completionHandler:^(UIPrintInteractionController *printInteractionController, BOOL completed, NSError *error) {
        
    }];
}

- (void)easyShareCopyTextToPasteboard:(NSString *)text andImage:(UIImage *)image andURL:(NSURL *)url andColor:(UIColor *)color {
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    if (text)   {[pasteboard setString:text];}
    if (image)  {[pasteboard setImage:image];}
    if (url)    {[pasteboard setURL:url];}
    if (color)  {[pasteboard setColor:color];}
}


- (void)easyShareSaveImageToCameraRoll:(UIImage *)image andOrVideoFromURL:(NSURL *)video {
    if (image) {
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
    }
    if (video) {
        ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
        [library writeVideoAtPathToSavedPhotosAlbum:video completionBlock:^(NSURL *assetURL, NSError *error) {
            if (error) {
                NSLog(@"Error saving video: %i",error.code);
            }
        }];
    }
}

- (void)slSharingWithID:(id)sharingService andText:(NSString *)text andImage:(UIImage *)image andURL:(NSURL *)url {
    SLComposeViewController *sharingComposer = [SLComposeViewController composeViewControllerForServiceType:sharingService];
    if([SLComposeViewController isAvailableForServiceType:sharingService])
    {
        SLComposeViewControllerCompletionHandler __block completionHandler=^(SLComposeViewControllerResult result){
            [sharingComposer dismissViewControllerAnimated:YES completion:nil];
        };
        
        if (image)  {[sharingComposer addImage:image];}
        if (text)   {[sharingComposer setInitialText:text];}
        if (url)    {[sharingComposer addURL:url];}
        
        [sharingComposer setCompletionHandler:completionHandler];
        [self presentViewController:sharingComposer animated:YES completion:nil];
    }
}
- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end