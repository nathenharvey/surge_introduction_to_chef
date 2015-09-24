#
# Cookbook Name:: audit-shell-shock
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
control_group 'Shell Shock' do
  control 'CVE-2014-6271' do # 09-Sep-2014
    it 'is remediated' do
      expect(command("env x='() { :;}; echo vulnerable' bash -c \"echo this is a test\"").stdout).not_to contain(/vulnerable/)
    end
  end

  control 'CVE-2014-6277' do # 09-Sep-2014
    it 'is remediated' do
      expect(command("bash -c \"f() { x() { _;}; x() { _;} <<a; }\" 2>/dev/null || echo vulnerable").stdout).not_to contain(/vulnerable/)
    end
  end

  control 'CVE-2014-6278' do # 09-Sep-2014
    it 'is remediated' do
      expect(command("shellshocker='() { echo You are vulnerable; }' bash -c shellshocker").exit_status).not_to eq 0
    end
  end

  control 'CVE-2014-7169' do # 24-Sep-2014
    it 'is remediated' do
      expect(command("env X='() { (shellshocker.net)=>\' bash -c \"echo date\"; cat echo; rm ./echo").stdout).to eq "date\n"
    end
  end

  control 'CVE-2014-7186' do # 25-Sep-2014
    it 'is remediated' do
      expect(command("bash -c 'true <<EOF <<EOF <<EOF <<EOF <<EOF <<EOF <<EOF <<EOF <<EOF <<EOF <<EOF <<EOF <<EOF <<EOF' ||
echo \"CVE-2014-7186 vulnerable, redir_stack\"").stdout).not_to contain(/CVE-2014-7186 vulnerable, redir_stack/)
    end
  end

  control 'CVE-2014-7187' do # 25-Sep-2014
    it 'is remediated' do
      expect(command("(for x in {1..200} ; do echo \"for x$x in ; do :\"; done; for x in {1..200} ; do echo done ; done) | bash ||
echo \"CVE-2014-7187 vulnerable, word_lineno\"").stdout).not_to contain(/CVE-2014-7187 vulnerable, word_lineno/)
    end
  end
end
