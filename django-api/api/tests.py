from webbrowser import get
from django.test import TestCase
from django.contrib.auth import get_user_model
from .models import Contact

class UsersManagersTests(TestCase):
    def testCreateSuperUser(self):
        User = get_user_model()
        user = User.objects.create_superuser(username="admin123", email="admin123@admin.com", password="verysecurePW!!!")
        self.assertEqual(user.username, "admin123")
        self.assertEqual(user.email, "admin123@admin.com")
        self.assertTrue(user.is_active)
        self.assertTrue(user.is_staff)
        self.assertTrue(user.is_superuser)
        try:
            self.assertIsNotNone(user.username)
        except AttributeError:
            pass 
        with self.assertRaises(ValueError):
            User.objects.create_superuser(username="admin123", email="admin123@admin.com", password="verysecurePW!!!", is_superuser=False)


class ContactsTests(TestCase):
    def testCreateNewContact(self):
        contact = Contact.objects.create(name="New Client", email="client@abc.com", message="Help me please!", phone="+123456789")
        self.assertEqual(contact.name, "New Client")
        self.assertEqual(contact.email, "client@abc.com")
        self.assertEqual(contact.message, "Help me please!")
        self.assertEqual(contact.phone, "+123456789")
        self.assertTrue(contact.is_active)
