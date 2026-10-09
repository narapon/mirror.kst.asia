# Mirror Registration Tasks for mirror.sg

**Contact Email:** mirrors@mirror.sg

## Current Status Summary

| Mirror | Size | Sync Freq | Requirements Met | Status |
|--------|------|-----------|------------------|--------|
| Debian | 1.4TB | 4x/day ✅ | ✅ ftpsync + trace file | **Ready to apply** |
| Ubuntu | 3.5TB | 4x/day ✅ | ✅ ubumirror | **Ready to apply** |
| Rocky | 3.1TB | 6x/day ✅ | ✅ All requirements | **Ready to apply** |
| Alpine | 1.2TB | 2x/day ✅ | ✅ Basic requirements | **Ready to apply** |
| Arch | 229GB | hourly ✅ | ✅ Random minute :17 | **Ready to submit** |
| CRAN | 671GB | 2x/day ✅ | ✅ All requirements | **Ready to apply** |

**Total: ~11TB / 14TB (82%)**

---

## 1. Debian ✅ SUBMITTED (2026-10-07)

### Requirements - All Met
- [x] Sync 4x per 24 hours (cron: 02:00, 08:00, 14:00, 20:00)
- [x] Using ftpsync (official Debian sync tool)
- [x] Trace file at `/debian/project/trace/mirror.sg`
- [x] Include source packages
- [x] Architectures: amd64, arm64, all, source
- [x] Serve via HTTP at `/debian`
- [x] Directory listings enabled

### Registration Process
1. Submit via web form: https://www.debian.org/mirror/submit
2. Include:
   - Mirror URL: `https://mirror.sg/debian/`
   - Contact email
   - Country: Singapore
   - Architectures: amd64, arm64, all, source
   - Sync method: ftpsync
   - Upstream: ftp.au.debian.org

### Contact
- Email: mirrors@debian.org

---

## 2. Ubuntu ✅ SUBMITTED (2026-10-07)

### Requirements - All Met
- [x] Sync 4x per 24 hours (cron: 00:00, 06:00, 12:00, 18:00)
- [x] Using ubumirror (official Ubuntu sync tool)
- [x] Include source packages
- [x] Serve via HTTP at `/ubuntu`
- [x] Architectures: amd64, arm64

### Registration Process
1. Create Launchpad account if needed
2. Register mirror at: https://launchpad.net/ubuntu/+newmirror
3. Include:
   - Mirror URL: `https://mirror.sg/ubuntu/`
   - Country: Singapore
   - Architectures: amd64, arm64

---

## 3. Rocky Linux ✅ SUBMITTED (2026-10-08)

### Requirements - All Met
- [x] Sync 6x per 24 hours (cron: 01:00, 05:00, 09:00, 13:00, 17:00, 21:00)
- [x] Bandwidth >= 1 Gbit/s
- [x] ~3TB storage
- [x] Architectures: x86_64, aarch64

### Registration Process
1. Create account at: https://accounts.rockylinux.org/
2. Login to Mirror Manager: https://mirrors.rockylinux.org/mirrormanager/
3. Register new site
4. Add Host: mirror.sg, Country: SG
5. Add Category "Rocky Linux"
6. Add URLs: https://mirror.sg/rocky/

### Contact
- Chat: https://chat.rockylinux.org/rocky-linux/channels/infrastructure

---

## 4. Alpine Linux ✅ SUBMITTED (2026-10-08)

### Requirements - All Met
- [x] Sync 2x/day (cron: 06:00, 18:00)
- [x] rsync from official source
- [x] HTTP/HTTPS serving
- [x] Architectures: x86_64, aarch64

### Registration Process
1. Email: mirrors@alpinelinux.org
2. Include:
   - Mirror URL: `https://mirror.sg/alpine/`
   - Rsync URL: `rsync://mirror.sg/alpine/` (if enabled)
   - Location: Singapore
   - Bandwidth

### Contact
- IRC: #alpine-linux on OFTC
- Email: mirrors@alpinelinux.org

---

## 5. Arch Linux ✅ READY TO SUBMIT

### Requirements - All Met
- [x] Disk space >= 100 GiB (229GB)
- [x] Sync from tier 1 mirror (ossmirror.mycloud.services)
- [x] Sync all contents
- [x] Sync hourly
- [x] HTTP/HTTPS support
- [x] **Sync on random minute** (:17) ✅ Fixed 2026-10-08

### Registration Process
1. Go to: https://gitlab.archlinux.org/archlinux/arch-mirrors/-/issues
2. Create feature-request with:
   - Mirror domain: mirror.sg
   - Location: Singapore
   - URLs: https://mirror.sg/archlinux/
   - Admin contact email: mirrors@mirror.sg
   - Upstream: ossmirror.mycloud.services

---

## 6. CRAN (R Project) ✅ SUBMITTED (2026-10-08)

### Requirements - All Met
- [x] Sync at least twice daily (cron: 00:00, 12:00)
- [x] Recursive mirror of complete tree
- [x] Use rsync with --delete

### Registration Process
1. Email: cran@r-project.org
2. Include:
   - URL: https://mirror.sg/cran/
   - Hosting institution: [Your org name]
   - Country and city: Singapore
   - Contact email
   - Update frequency: twice daily

---

## Priority Order for Registration

1. **Debian** - ftpsync ready, trace file working ✅
2. **Ubuntu** - ubumirror ready ✅
3. **Rocky** - 6x/day sync configured ✅
4. **CRAN** - Simple email registration ✅
5. **Alpine** - Email registration ✅
6. **Arch** - Random minute fixed (:17), ready for GitLab issue ✅

---

## Quick Reference - Registration URLs

| Mirror | Registration URL |
|--------|-----------------|
| Debian | https://www.debian.org/mirror/submit |
| Ubuntu | https://launchpad.net/ubuntu/+newmirror |
| Rocky | https://mirrors.rockylinux.org/mirrormanager/ |
| Alpine | Email mirrors@alpinelinux.org |
| Arch | https://gitlab.archlinux.org/archlinux/arch-mirrors/-/issues |
| CRAN | Email cran@r-project.org |

---

## Completed Setup Tasks

- [x] Debian: Switched from custom rsync to ftpsync
- [x] Debian: Trace file created at `/debian/project/trace/mirror.sg`
- [x] Rocky: Updated sync from 2x/day to 6x/day
- [x] Arch: Changed cron from :00 to :17 (random minute requirement)
- [x] All mirrors: HTTP/HTTPS serving working
- [x] All mirrors: Directory listings enabled

## Remaining Tasks

- [ ] **Arch**: Submit GitLab issue for registration
- [ ] Set up rsync daemon for public access (optional, preferred by some)
