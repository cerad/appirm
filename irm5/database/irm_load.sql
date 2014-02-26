INSERT INTO users
(`name`, password, fullname, email, building, phone, access, comments)
VALUES
('Admin',md5('admin'),'Administrator Guy','root@localhost',
 'Admin Place (in front of the computer)','Use e-mail','admin',''),

('Guest',     md5('guest'),     'Guest User',     'email',          '','','post-only',''),
('Normal',    md5('normal'),    'Normal User',    'user@localhost', '','','normal',   ''),
('Tech',      md5('tech'),      'Technician User','tech@localhost', '','','tech',     ''),
('IRMConnect',md5('irmconnect'),'Special account','email',          '','','post-only','');

